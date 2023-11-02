namespace :import do
  desc "Import Commands from JSON files in db/docker_commands/basics"
  task commands: :environment do
    Dir.glob("db/docker_commands/basics/*.json").each do |json_file|
      data = JSON.parse(File.read(json_file))
      first_level = data["command"]["first_level"]["value"]

      data["command"]["second_level"].each do |command_data|
        flag = command_data['flag']
        long = flag.tr!('-', '').eql?(command_data['value']) ? "--#{command_data['flag']}" : ''
        short = flag.tr!('-', '').eql?(command_data['value']) ? '' : "-#{command_data['flag']}"

        data = {
          tech: 'docker',
          command: 'docker',
          flag: command_data["value"],
          flag_long: long,
          flag_short: short,
          usage: command_data["usage"],
          description: command_data["description"],
          result: command_data["result"]
        }.compact_blank!

        Command.create!(data)
      end
    end
  end

  desc 'Create Commands from Gpt with DockerCommandsGeneratorService'
  task command_generator: :environment do
    puts Command.destroy_all
    docker_frequently_commands = [
      'docker attach',
      'docker build',
      'docker commit',
      'docker cp',
      'docker create',
      'docker diff',
      'docker events',
      'docker exec',
      'docker export',
      'docker history',
      'docker images',
      'docker import',
      'docker info',
      'docker inspect',
      'docker kill',
      'docker load',
      'docker login',
      'docker logout',
      'docker logs',
      'docker pause',
      'docker port',
      'docker ps',
      'docker pull',
      'docker push',
      'docker rename',
      'docker restart',
      'docker rm',
      'docker rmi',
      'docker run',
      'docker save',
      'docker search',
      'docker start',
      'docker stats',
      'docker stop',
      'docker tag',
      'docker top',
      'docker unpause',
      'docker update',
      'docker version',
      'docker wait',
      'docker builder',
      'docker buildx',
      'docker compose',
      'docker config',
      'docker container',
      'docker context',
      'docker extension',
      'docker image',
      'docker manifest',
      'docker network',
      'docker node',
      'docker plugin',
      'docker sbom',
      'docker scan',
      'docker secret',
      'docker service',
      'docker stack',
      'docker swarm',
      'docker system',
      'docker trust',
      'docker volume'
    ]

    docker_frequently_commands.each_with_index do |command, idx|
    # rails = ['rails new', 'rails server', 'rails plugin', 'rails console']
    # rails.each_with_index do |command, idx|
      puts "[#{idx+1}/#{docker_frequently_commands.size}] Command #{command}"

      suggester = DockerCommandsGenerator.new(command)
      command_params = suggester.call
      command_params.each do |data|
        Command.create! data
        puts "Command #{data[:flag]} created"
      rescue => e
        puts e.message
        puts "Command #{data[:flag]} not created"
        puts command
        puts '----------------'
      end
    end
  end
end
