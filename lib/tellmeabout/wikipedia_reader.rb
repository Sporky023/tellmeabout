require_relative 'wikipedia_scrubber'

class WikipediaReader
  def self.verbalize(search_term)
    new(WikipediaFetcher, Verbalizer).verbalize(search_term)
  end

  def initialize(fetcher, verbalizer)
    @fetcher, @verbalizer = fetcher, verbalizer
  end

  def verbalize(search_term)
    say(clean(fetch(search_term)))
  end

  def say(clean_content)
    @verbalizer.say_to_speakers(clean_content)
  end

  def clean(html_content)
    WikipediaScrubber.scrub(html_content)
  end

  def fetch(search_term)
    @fetcher.fetch(search_term)
  end
end
