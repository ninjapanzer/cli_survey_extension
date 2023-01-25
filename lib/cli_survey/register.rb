module CliSurvey::Register
  def self.call
    [
      {
        command_klass: CliSurvey::Command::Survey::SurveyCommands,
        details: CliSurvey::Command::Survey::Command.commands['survey']
      },
    ]
  end
end
