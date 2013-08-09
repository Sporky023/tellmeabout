require 'nokogiri'

class WikipediaScrubber
  CSS_SELECTORS_CONTAINING_READABLE_CONTENT = [
    'h1',
    'h2 > span:first-child',
    '.content_block > p',
    '#bodyContent #mw-content-text p',
    '#bodyContent #siteSub'
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

    waxed_content_pieces = content_pieces.map do |content_piece|
      wax(content_piece)
    end

    waxed_content_pieces.join(' ')
  end

  private

  def wax(content_piece)
    content_piece.gsub(/\[\d+\]/, '')
  end

  def page
    @page ||= Nokogiri::HTML(@html_content)
  end
end
