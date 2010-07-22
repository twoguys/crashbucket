class String
  def slugify
    returning self.gsub(/'/, '').gsub(/[^a-zA-Z0-9]+/, '-') do |slug|
      slug.chop! if slug.last == '-'
    end
  end
end