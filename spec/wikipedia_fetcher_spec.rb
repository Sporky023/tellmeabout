require 'spec_helper'
require 'tellmeabout/wikipedia_fetcher'

describe WikipediaFetcher do
  it 'contacts wikipedia' do
    article_slug = 'search_term'

    described_class.should_receive(:open).with("http://en.wikipedia.org/wiki/#{article_slug}")

    described_class.fetch(article_slug)
  end

  it 'returns html' do
    article_slug = 'search_term'
    html_content = 'html content'

    described_class.stub(:open) { html_content }

    described_class.fetch(article_slug).should == html_content
  end
end
