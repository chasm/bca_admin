require 'paperclip'

class Photo
  include Mongoid::Document
  include Paperclip::Glue
  
  embedded_in :automobile
  
  attr_accessible :id, :photo
  
  has_attached_file :photo, :styles => {
    :medium => "480x360>",
    :thumb => "240x180>"
  }
  
  field :id, type: String
  field :photo_file_name, type: String
end
