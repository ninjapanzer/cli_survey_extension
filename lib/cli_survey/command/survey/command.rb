module CliSurvey::Command::Survey
  # Create a thor command called survey
  # The survey command will read a YAML file and ask the user questions
  # The Answers will be stored in a sqlite database
  class Command < Thor
    using CliToolkit::Refinements::ThorSubcommandRegistry

    namespace :survey
    desc "survey SUBCOMMAND", "Take a survey"
    subcommand commands_klass: SurveyCommands
  end
end
