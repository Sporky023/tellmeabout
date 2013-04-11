require "tellmeabout/version"

require_relative 'tellmeabout/wikipedia_reader'

module Tellmeabout
  def self.read_article(article_name)
    reader = WikipediaReader.new(article_name)
    reader.read
  end
end
