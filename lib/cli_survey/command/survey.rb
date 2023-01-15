module CliSurvey::Command
  # Create a thor command called Survey
  # The Survey command will read a YAML file and ask the user questions
  # The Answers will be stored in a sqlite database
  class Survey < Thor
    namespace :survey
    desc "survey SUBCOMMAND", "Take a survey"

    class SubCommands < Thor
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

    no_commands do
      def self.register
        Thor.register(self, "survey", "survey", "Take a survey")
        # Thor.no_commands do
          Thor.subcommand "survey", SubCommands
        # end
      end
    end
  end

  # Thor.no_commands do
  #   Thor.subcommand "survey", CliSurvey::Command::Survey::SubCommands
  # end
  Thor.map "survey start" => "survey:start"
  Thor.map "survey stop" => "survey:stop"
end
