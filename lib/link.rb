class Link

  include Datamapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
  property :language, String

end
