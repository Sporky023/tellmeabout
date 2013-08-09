require 'open-uri'

class WikipediaFetcher
  def self.fetch(search_term)
    open("http://m.wikipedia.org/wiki/#{search_term}")
  end
end
