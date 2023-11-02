# lib/tasks/commands.rake
namespace :commands do
  desc "Load commands from docker_buildx_command into the database"
  task load: :environment do
    load Rails.root.join('db/docker/management/docker_buildx_command.rb')

    def create_command(data, parent_id = nil)
      command = Command.create!(
        tech: data[:tech],
        command: data[:command],
        usage: data[:usage],
        level: data[:level],
        parent_id: parent_id
      )

      create_translations(command, data[:result], data[:nb])

      data[:options].each do |option|
        create_option(command, option)
      end

      data[:subcommands].each do |subcommand_data|
        create_command(subcommand_data, command.id)
      end
    end

    def create_option(command, data)
      option = Option.create!(
        command: command,
        long: data[:long],
        type: data[:type],
        level: data[:level],
        usage: data[:usage]
      )

      create_translations(option, nil, data[:nb])
    end

    def create_translations(record, result, nb)
      locales = { es: "es", en: "en" }
      locales.each do |key, locale|
        Translation.create!(
          translatable: record,
          locale: locale,
          result: result ? result[key] : nil,
          nb: nb ? nb[key] : nil
        )
      end
    end

    create_command(DOCKER_BUILDX_COMMAND)
  end
end
