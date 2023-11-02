require_relative '../docker/management/docker_buildx_command'

# Método para crear comandos y subcomandos de forma recursiva
def create_command(data, parent_id = nil)
  command = Command.create(
    tech: data[:tech],
    command: data[:command],
    usage: data[:usage],
    result_es: data[:result][:es],
    result_en: data[:result][:en],
    level: data[:level],
    nb_es: data[:nb][:es],
    nb_en: data[:nb][:en],
    parent_id: parent_id
  )

  # Crea opciones
  data[:options].each do |option|
    Option.create(
      command_id: command.id,
      long: option[:long],
      type: option[:type],
      level: option[:level],
      usage: option[:usage],
      nb_es: option[:nb][:es],
      nb_en: option[:nb][:en]
    )
  end


  # Crea subcomandos
  data[:subcommands].each do |subcommand_data|
    create_command(subcommand_data, command.id)
  end
end

# Inicia la creación de comandos y subcomandos
create_command(docker_buildx_command)