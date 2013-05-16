require 'pathname'

module Fixtures
  ROOT_PATH = Pathname.new('./spec/support/fixtures')

  def html_fixture(filename)
    ROOT_PATH.join(filename + '.html').read
  end
end

RSpec.configure do |c|
  c.include(Fixtures)
end
