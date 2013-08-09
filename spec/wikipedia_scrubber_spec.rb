require 'spec_helper'
require 'tellmeabout/wikipedia_scrubber'

describe WikipediaScrubber do
  it "removes HTML tags" do
    html_content = html_fixture('should_become_hello_world')
    clean_content = 'Hello world'
    described_class.scrub(html_content).should == clean_content
  end

  it 'extracts properly from section headings' do
    html_content = html_fixture('section_heading')
    clean_content = 'Discovery'
    described_class.scrub(html_content).should == clean_content
  end

  it 'extracts properly from section content' do
    html_content = html_fixture('content_block')
    clean_content = 'American researchers Elmer McCollum and Marguerite Davis in 1914 discovered a substance in cod liver oil which later was called "vitamin A".'
    described_class.scrub(html_content).should == clean_content
  end
end
