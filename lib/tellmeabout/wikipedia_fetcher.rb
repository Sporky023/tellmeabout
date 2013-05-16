require 'open-uri'

class WikipediaFetcher
  def self.fetch(search_term)
    open("http://en.wikipedia.org/wiki/#{search_term}")
  end
end
