class RestController < ApplicationController
  respond_to :json

  # before_filter :authorize
  before_filter :pack_em_up
  
  # GET /items
  # GET /parents/:parent_id/items
  # GET /grandparents/:grandparent_id/parents/:parent_id/items
  def index
  end

  # GET /items/:id
  # GET /parents/:parent_id/items/:id
  # GET /grandparents/:grandparent_id/parents/:parent_id/items/:id
  def show
    head :not_found unless instance_variable_get("@#{@name}")
  end

  # PUT /items/:id
  # PUT /parents/:parent_id/items/:id
  # PUT /grandparents/:grandparent_id/parents/:parent_id/items/:id
  def update
    item = instance_variable_get("@#{@name}")
    symb = params[:controller].singularize.to_sym
    
    if item
      # This is an update request
      if item.update_attributes params[symb]
        head :no_content
      else
        render :errors, status: :unprocessable_entity # What status code should this return?
      end
    else
      # This is a create request
      item = params[:controller].singularize.camelize.constantize.new params[symb]
      item.id = params[:id]
      
      begin
        if item.save
          render :show
        else
          render :errors, status: :unprocessable_entity # What status code should this return?
        end
      rescue Mongoid::Errors::NoParent => e
        unless @names.empty?
          pname = @names.pop
          parent = instance_variable_get("@#{pname}")
          
          item = parent.send(params[:controller]).create(params[symb])
          
          if item.save
            render :show
          else
            render :errors, status: :unprocessable_entity # What status code should this return?
          end
        end
      end
    end
  end

  # DELETE /items/:id
  # DELETE /parents/:parent_id/items/:id
  # DELETE /grandparents/:grandparent_id/parents/:parent_id/items/:id
  def destroy
    if item = instance_variable_get("@#{@name}")
      item.destroy
      head :no_content
    else
      head :not_found
    end
  end
  
  private
  
  def pack_em_up
    chain = get_ancestors_and_self
    @names = []
    
    while chain.length > 0 do
      item = chain.shift
      uuid = params[item] || params[:id]
      @name = item.chomp("_id")
      @names << @name
      
      # First item, get the class, after that, get the association
      out = if out.nil?
        @name.camelize.constantize
      else
        out.__send__(@name.pluralize)
      end
      
      # If we have an id, find the object and set an instance variable
      # Else, if it's not an array (of associations), find all
      begin
        if uuid
          out = out.find(uuid)
          instance_variable_set("@#{@name}", out)
        else
          out = out.all.to_a if out.class != Array
          instance_variable_set("@#{@name.pluralize}", out)
        end
      rescue
        head :not_found unless params[:action] == "update"
      end
    end
    
    @names.pop
  end
end
