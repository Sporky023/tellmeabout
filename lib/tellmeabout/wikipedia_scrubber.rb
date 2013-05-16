require 'nokogiri'

class WikipediaScrubber
  CSS_SELECTORS_CONTAINING_READABLE_CONTENT = [
    '#firstHeading',
    '#bodyContent #mw-content-text p',
    '#bodyContent #siteSub',
    'h2'
  ]

  def self.scrub(html_content)
    new(html_content).scrub
  end

  def initialize(html_content)
    @html_content = html_content
  end

  def scrub
    content_pieces = []

    compound_selector = CSS_SELECTORS_CONTAINING_READABLE_CONTENT.join(', ')

    page.css(compound_selector).each do |element|
      content_pieces.push element.content
    end

    content_pieces.join(' ')
  end

  private

  def page
    @page ||= Nokogiri::HTML(@html_content)
  end
end
