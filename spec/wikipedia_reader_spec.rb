require 'spec_helper'
require 'tellmeabout/wikipedia_reader'

describe WikipediaReader do
  it 'wires together the wikipedia fetcher and the verbalizer' do
    html_content = html_fixture('should_become_hello_world')
    clean_content = 'Hello world'

    fake_fetcher = stub
    fake_verbalizer = stub

    fake_fetcher.stub(:fetch).with('search term').and_return(html_content)
    fake_verbalizer.should_receive(:say_to_speakers).with(clean_content)
    described_class.new(fake_fetcher, fake_verbalizer).verbalize('search term')
  end
end
