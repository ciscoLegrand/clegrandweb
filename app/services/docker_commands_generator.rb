class DockerCommandsGenerator
  def initialize(command)
    @command = command
    @gpt_service = Openai::GptService.new(
      model: "gpt-3.5-turbo",
      max_tokens: 3750,
      temperature: 1
    )
  end

  def call
    messages = build_messages
    suggestion = @gpt_service.call(messages)
    
    if suggestion
      commands = build_command_params(suggestion)
      return commands
    else
      raise StandardError.new('Invalid GPT service response')
    end
  end

  private

  def build_messages
    [{
      role: "user",
      content: "Act as a bash console, simulate a execution of a command #{@command} --help  and provide and describe all flags available for without omission or embellishment. The data must strictly adhere to the following template. Do not provide any comments, explanations, or additional information that falls outside of this format. 
      Need to get a response where the first element is the command, with their main explanation and the basic usage of the command, command is level 1, the rest of the elements are the flags available for the command, with level 2 or 3 if they has subcomands or similar;
      Example response format for `docker ps --help` command:
      flag: all
      flag_long: --all
      flag_short: -a
      level: 2
      description: show a list of all containers running or stopped
      result: Show all containers (default shows just running)
      usage: docker ps -a
      it is mandatory that not add a number before the flag key, the response needs to call the keys are show here, not 1  flag...; the results that need provided are all flags avalilable for each command or the 20 commnads most frequently used by devops engineers.
      all keys need a value.
      level is a number that represents the deep level of the flag, 1 for COMMAND, 2 for FLAG, 3 for FLAG OPTIONS...the first element of the response must be level 1, with the flag keys with value as a command ie docker ps, ps is the value for flag, docker ps --all, --all is the value for flag."
    }]
  end

  def build_command_params(suggestion)
    commands = []
    flags = suggestion.split("\n\n")
    flags.each do |flag_data|
      flag_info = {
        tech: @command.split(' ')[0],
        command: @command.split(' ')[1],
      }
      flag_data.split("\n").each do |line|
        key, value = line.split(": ")
        next if key.nil? || value.nil?
        
        flag_info[key.strip.to_sym] = value.strip
      rescue => e
        puts e.message
      end
      commands << flag_info
    end
    commands
  end
end
