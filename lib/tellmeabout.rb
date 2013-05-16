require "tellmeabout/version"

require_relative 'tellmeabout/wikipedia_reader'

module Tellmeabout
  def self.read_article(article_name)
    WikipediaReader.verbalize(article_name)
  end
end
