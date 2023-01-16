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
  end
end