require 'launchy'
require 'fileutils'

module CliSurvey
  class Survey
    def initialize(survey_file:)
      @survey_file = survey_file
    end

    def create
      FileUtils.mkdir_p(File.dirname(@survey_file))
      File.open(@survey_file, 'w') do |f|
        f.write <<~YAML
          ---
          name: "#{@survey_file}"
          ---
        YAML
      end
    end

    def open
      Launchy.open @survey_file
    end

    def dup_check?
      File.exist?(@survey_file)
    end

    class SurveyAlreadyExistsError < CliSurvey::Error; end
  end
end