class Link
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :url,        Text

  has n, :tags, :through => Resource

  def print_tags
    string = ''
    tags.each {|tag| string << (tag.name + ' ')}
    string
  end

end
