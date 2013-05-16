class Verbalizer
  def self.say_to_speakers(content)
    new(content).say_to_speakers
  end

  def initialize(content)
    @content = content
    @rate = 230
  end

  def say_to_speakers
    `#{command(@content)} -r #{@rate} -v #{voice}`
  end

  def command(string)
    "say \"#{string.gsub('"', '\"')}\""
  end

  def voice
    'Vicki'
  end
end
