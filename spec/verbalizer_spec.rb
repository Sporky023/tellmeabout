require 'spec_helper'
require 'tellmeabout/verbalizer'

describe Verbalizer do
  it 'can speak content to speakers' do
    clean_content = 'foo'
    verbalizer = described_class.new(clean_content)
    verbalizer.should_receive(:`).with(/say "#{clean_content}" -r \d+ -v \w+/)
    verbalizer.say_to_speakers
  end
end
