require_relative 'wikipedia_content_cleaner'

class WikipediaReader
  OUTPUT_TYPE = ['only to file', 'only to speakers', 'to both'][1]

  def initialize(article_name)
    @article_name = article_name
    @rate = 230
    @outfile_path = "#{article_name}.aiff"
  end

  def read
    read_wikipedia_article
  end

  def read_wikipedia_article
    cleaner = WikipediaContentCleaner.new(@article_name)
    cleaner.load_from_wikipedia
    cleaner.delete_silent_substrings

    @cleaned_content = cleaner.content

    case OUTPUT_TYPE
    when 'only to file'
      say_to_file
    when 'only to speakers'
      say_to_speakers
    when 'to both'
      say_to_file
      say_to_speakers
    end

  end

  def say_to_file
    total_command = "#{command(@cleaned_content)} -r #{@rate} -v #{voice} -o #{outfile_path}"
    `#{total_command}`
  end

  def say_to_speakers
    `#{command(@cleaned_content)} -r #{@rate} -v #{voice}`
  end

  def command(string)
    "say \"#{string.gsub('"', '\"')}\""
  end

  def voice
    'Vicki'
  end

  def outfile_path
    "/Users/luke/Desktop/#{@article_name}.aiff"
  end
end
