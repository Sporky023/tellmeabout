require 'spec_helper'
require 'tellmeabout/wikipedia_scrubber'

describe WikipediaScrubber do
  it "removes HTML tags" do
    html_content = html_fixture('should_become_hello_world')
    clean_content = 'Hello world'
    described_class.scrub(html_content).should == clean_content
  end
end
