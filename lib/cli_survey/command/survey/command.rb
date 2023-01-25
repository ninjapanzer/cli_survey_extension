module CliSurvey::Command::Survey
  # Create a thor command called survey
  # The survey command will read a YAML file and ask the user questions
  # The Answers will be stored in a sqlite database
  class Command < Thor
    namespace :survey
    desc "survey SUBCOMMAND", "Take a survey"
    subcommand "survey", SurveyCommands

    def self.prepare
      register_command(SurveyCommands, "survey")
    end
  end
end
