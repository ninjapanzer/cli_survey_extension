module CliSurvey::Command::Survey
  class InitCommand

    attr_reader :survey_service, :options
    def initialize(args: {}, options: {}, config: {})
      @args = args
      @options = options
      @config = config
      @survey_filename = sanitize_filename(args[:name])
      @survey_file = File.join(CliSurvey::CONFIG['surveyDir'], @survey_filename + ".yml")
      @survey_dir = File.join(Dir.home,'.cli','surveyDir', @survey_filename + ".yml")
      @survey_service = CliSurvey::Survey.new(survey_file: @survey_file)
      puts "init"
    end

    def create_survey_file
      if survey_service.dup_check?
        raise CliSurvey::Survey::SurveyAlreadyExistsError, "Survey already exists"
      end
      survey_service.create
    end

    def sanitize_filename(filename)
      # Split the name when finding a period which is preceded by some
      # character, and is followed by some character other than a period,
      # if there is no following period that is followed by something
      # other than a period (yeah, confusing, I know)
      fn = filename.split /(?<=.)\.(?=[^.])(?!.*\.[^.])/m

      # We now have one or two parts (depending on whether we could find
      # a suitable period). For each of these parts, replace any unwanted
      # sequence of characters with an underscore
      fn.map! { |s| s.gsub /[^a-z0-9\-]+/i, '_' }

      # Finally, join the parts with a period and return the result
      return fn.join '.'
    end

  end
end