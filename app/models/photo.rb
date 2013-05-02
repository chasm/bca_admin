require 'paperclip'

class Photo
  include MongoMapper::EmbeddedDocument
  include Paperclip::Glue
  
  attr_accessible :_id, :automobile, :photo
  
  has_attached_file :photo, :styles => {
    :medium => "480x360>",
    :thumb => "240x180>"
  }
  
  key :_id, String
  key :photo_file_name, String
end
