module CliSurvey::Command::Survey
  class SurveyCommands < Thor
    desc "start", "Start the survey"
    def start
      db = Cli::Storage.db(db: Cli::CONFIG['surveyDb'])
      Cli::Storage.migrate if Cli::Storage.requires_migration?
      puts "hi"
    end

    desc "stop", "Stop the survey"
    def stop
      puts "bye"
    end

    desc "list", "Start the survey"
    def list
      ListCommand.new
    end

    desc "init [options] <survey name>", "Create a new survey"
    option :open, type: :boolean, default: true, desc: "open survey after creation"
    def init(survey_name)
      puts options
      cmd = InitCommand.new(args: {name: survey_name}, options: options)
      cmd.create_survey_file
    end
  end
end