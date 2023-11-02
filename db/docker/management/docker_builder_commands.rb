docker_builder_commands = [
  {
    tech: 'docker',
    command: 'builder',
    sub_commands: [
      {
        command: 'build',
        usage: 'docker builder build [OPTIONS] PATH | URL | -',
        result: { es: 'Construye una imagen a partir de un Dockerfile', en: 'Build an image from a Dockerfile' },
        level: 2,
        options: [
          { long: '--add-host', type: 'list', level: 3 },
          { long: '--build-arg', type: 'list', level: 3 },
          { long: '--cache-from', type: 'strings', level: 3 },
          { long: '--disable-content-trust', type: 'boolean', default: true, level: 3 },
          { short: '-f', long: '--file', type: 'string', level: 3 },
          { long: '--iidfile', type: 'string', level: 3 },
          { long: '--isolation', type: 'string', level: 3 },
          { long: '--label', type: 'list', level: 3 },
          { long: '--network', type: 'string', default: 'default', level: 3 },
          { long: '--no-cache', type: 'boolean', level: 3 },
          { short: '-o', long: '--output', type: 'stringArray', level: 3 },
          { long: '--platform', type: 'string', level: 3 },
          { long: '--progress', type: 'string', default: 'auto', level: 3 },
          { long: '--pull', type: 'boolean', level: 3 },
          { short: '-q', long: '--quiet', type: 'boolean', level: 3 },
          { long: '--secret', type: 'stringArray', level: 3 },
          { long: '--ssh', type: 'stringArray', level: 3 },
          { short: '-t', long: '--tag', type: 'list', level: 3 },
          { long: '--target', type: 'string', level: 3 }
        ],
        nb: {
          es: 'Reemplace PATH | URL | - con la ubicación del Dockerfile o el contexto de compilación.',
          en: 'Replace PATH | URL | - with the location of the Dockerfile or build context.'
        }
      },
      {
        command: 'prune',
        usage: 'docker builder prune',
        result: { es: 'Elimina el caché de compilación', en: 'Remove build cache' },
        level: 2,
        options: [],
        nb: {
          es: 'Este comando elimina todos los objetos de caché de compilación que no están siendo utilizados.',
          en: 'This command removes all build cache objects that are not in use.'
        }
      }
    ],
    usage: 'docker builder COMMAND',
    result: { es: 'Gestiona las construcciones', en: 'Manage builds' },
    level: 1,
    nb: {
      es: 'Utilice "docker builder COMMAND --help" para obtener más información sobre un comando.',
      en: 'Use "docker builder COMMAND --help" for more information on a command.'
    }
  }
]
