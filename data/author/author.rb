def save_authors(authors)
  authors_store = authors.map do |author|
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
  file = File.open('./data/author/author.json', 'w')
  file.puts(JSON.pretty_generate(authors_store))
  file.close
end

def read_authors
  if File.exist?('./data/author/author.json')
    authors = JSON.parse(File.read('./data/author/author.json'))
    authors.map do |author|
      Author.new(author['first_name'], author['last_name'], author['id'])
    end
  else
    []
  end
end
