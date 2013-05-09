require 'paperclip'

class Photo
  include Mongoid::EmbeddedDocument
  include Paperclip::Glue
  
  attr_accessible :_id, :automobile, :photo
  
  has_attached_file :photo, :styles => {
    :medium => "480x360>",
    :thumb => "240x180>"
  }
  
  field :_id, String
  field :photo_file_name, String
end
