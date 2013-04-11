require 'open-uri'
require 'nokogiri'

class WikipediaContentCleaner
  attr_accessor :content

  def initialize(article_name)
    @article_name = article_name
  end

  def load_from_wikipedia
    url = "http://en.wikipedia.org/wiki/#{@article_name}"
    html = Nokogiri::HTML(open(url))

    content_pieces = []

    compound_selector = css_selectors_containing_readable_content.join(', ')

    html.css(compound_selector).each do |element|
      content_pieces.push element.content
    end

    @content = content_pieces.join(' ')
  end

  def css_selectors_containing_readable_content
    [
      '#firstHeading',
      '#bodyContent #mw-content-text p',
      '#bodyContent #siteSub',
      'h2'
    ]
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
