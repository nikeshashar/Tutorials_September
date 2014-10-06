class Link

  include DataMapper::Resource

  has n, :tags, :through => Resource
  
  # This block describes what resources our model will have
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String
  property :cost,   Integer


end