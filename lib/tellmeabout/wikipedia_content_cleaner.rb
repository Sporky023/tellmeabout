require 'open-uri'
require 'nokogiri'

class WikipediaContentCleaner
  attr_accessor :content

  CSS_SELECTORS_CONTAINING_READABLE_CONTENT = [
    '#firstHeading',
    '#bodyContent #mw-content-text p',
    '#bodyContent #siteSub',
    'h2'
  ]

  def initialize(article_name)
    @article_name = article_name
  end

  def load_from_wikipedia
    read_raw_html_from_wikipedia
    generate_readable_content_from_raw_html
  end

  def read_raw_html_from_wikipedia
    url = "http://en.wikipedia.org/wiki/#{@article_name}"
    @raw_html = Nokogiri::HTML(open(url))
  end

  def generate_readable_content_from_raw_html
    content_pieces = []

    compound_selector = CSS_SELECTORS_CONTAINING_READABLE_CONTENT.join(', ')

    @raw_html.css(compound_selector).each do |element|
      content_pieces.push element.content
    end

    @content = content_pieces.join(' ')
  end


  def css_selectors_to_be_ignored
    [
      'table'
    ]
  end

  def delete_silent_substrings
    @content = @content.gsub(/\[\d+\]/, '')
    @content = @content.gsub(/\[edit\]/, '')
    # @content = @content.gsub(/(\\\\\\\\d+\\\\\\\\.\\\\\\\\d+)×10(\\\\\\\\d+)/, "$1 times ten to the $2")
  end
end
