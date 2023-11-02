DOCKER_BUILDX_COMMAND = {
  tech: 'docker',
  command: 'buildx',
  usage: 'docker buildx [OPTIONS] COMMAND',
  result: { es: 'Capacidades de compilación extendidas con BuildKit', en: 'Extended build capabilities with BuildKit' },
  level: 1,
  nb: {
    es: 'Documentación básica para el comando buildx.',
    en: 'Basic documentation for buildx command.'
  },
  options: [
    {
      long: '--builder',
      type: 'string',
      level: 2,
      usage: 'docker buildx --builder STRING',
      nb: { es: 'Especifica el nombre del constructor.', en: 'Specifies the name of the builder.' }
    }
  ],
  subcommands: [
    {
      command: 'bake',
      usage: 'docker buildx bake [OPTIONS] [TARGET...]',
      result: { es: 'Construir desde un archivo', en: 'Build from a file' },
      level: 2,
      nb: {
        es: 'Construye una o más imágenes desde un archivo.',
        en: 'Builds one or more images from a file.'
      },
      options: [
        {
          long: '--builder',
          type: 'string',
          level: 3,
          usage: 'docker buildx bake --builder STRING',
          nb: { es: 'Especifica el nombre del constructor.', en: 'Specifies the name of the builder.' }
        },
        {
          long: '-f, --file',
          type: 'stringArray',
          level: 3,
          usage: 'docker buildx bake -f FILE [--file FILE]',
          nb: { es: 'Especifica uno o más archivos de construcción.', en: 'Specifies one or more build files.' }
        },
        {
          long: '--load',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx bake --load',
          nb: { es: 'Carga las imágenes construidas en el motor de Docker local.', en: 'Loads built images into local Docker engine.' }
        },
        {
          long: '--metadata-file',
          type: 'string',
          level: 3,
          usage: 'docker buildx bake --metadata-file FILE',
          nb: { es: 'Especifica un archivo donde guardar metadatos de la compilación.', en: 'Specifies a file to save build metadata.' }
        },
        {
          long: '--no-cache',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx bake --no-cache',
          nb: { es: 'No utiliza caché al construir la imagen.', en: 'Do not use cache when building the image.' }
        },
        {
          long: '--print',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx bake --print',
          nb: { es: 'Imprime el plan de compilación sin ejecutarlo.', en: 'Prints the build plan without executing it.' }
        },
        {
          long: '--progress',
          type: 'string',
          default: 'auto',
          level: 3,
          usage: 'docker buildx bake --progress [auto|plain|tty]',
          nb: { es: 'Establece el tipo de salida de progreso.', en: 'Sets the type of progress output.' }
        },
        {
          long: '--pull',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx bake --pull',
          nb: { es: 'Siempre intenta tirar de la imagen más reciente del contexto y de las imágenes de los padres.', en: 'Always attempt to pull a newer version of the image from the context and parent images.' }
        },
        {
          long: '--push',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx bake --push',
          nb: { es: 'Empuja las imágenes a la registry.', en: 'Pushes images to the registry.' }
        },
        {
          long: '--set',
          type: 'stringArray',
          level: 3,
          usage: 'docker buildx bake --set target.key=value',
          nb: { es: 'Establece una opción para el objetivo.', en: 'Sets an option for the target.' }
        }
      ]
    },
    {
      command: 'build',
      usage: 'docker buildx build [OPTIONS] PATH | URL | -',
      result: { es: 'Iniciar una compilación', en: 'Start a build' },
      level: 2,
      nb: {
        es: 'Inicia una compilación desde una ruta, URL o entrada estándar.',
        en: 'Starts a build from a path, URL, or standard input.'
      },
      options: [
        {
          long: '--add-host',
          type: 'strings',
          format: 'host:ip',
          level: 3,
          usage: 'docker buildx build --add-host HOST:IP',
          nb: { es: 'Agrega una entrada de host personalizada.', en: 'Adds a custom host entry.' }
        },
        {
          long: '--allow',
          type: 'strings',
          example: 'network.host, security.insecure',
          level: 3,
          usage: 'docker buildx build --allow VALUE',
          nb: { es: 'Permite características adicionales.', en: 'Allows additional features.' }
        },
        {
          long: '--build-arg',
          type: 'stringArray',
          level: 3,
          usage: 'docker buildx build --build-arg KEY=VALUE',
          nb: { es: 'Establece argumentos de construcción.', en: 'Sets build arguments.' }
        },
        {
          long: '--build-context',
          type: 'stringArray',
          example: 'name=path',
          level: 3,
          usage: 'docker buildx build --build-context NAME=PATH',
          nb: { es: 'Establece el contexto de la construcción.', en: 'Sets the build context.' }
        },
        {
          long: '--builder',
          type: 'string',
          level: 3,
          usage: 'docker buildx build --builder STRING',
          nb: { es: 'Especifica el nombre del constructor.', en: 'Specifies the name of the builder.' }
        },
        {
          long: '--cache-from',
          type: 'stringArray',
          example: 'user/app:cache, type=local,src=path/to/dir',
          level: 3,
          usage: 'docker buildx build --cache-from TYPE=LOCAL,SRC=PATH',
          nb: { es: 'Especifica las imágenes de caché externas.', en: 'Specifies external cache images.' }
        },
        {
          long: '--cache-to',
          type: 'stringArray',
          example: 'user/app:cache, type=local,dest=path/to/dir',
          level: 3,
          usage: 'docker buildx build --cache-to TYPE=LOCAL,DEST=PATH',
          nb: { es: 'Especifica las imágenes de caché de destino.', en: 'Specifies destination cache images.' }
        },
        {
          long: '--cgroup-parent',
          type: 'string',
          level: 3,
          usage: 'docker buildx build --cgroup-parent STRING',
          nb: { es: 'Especifica el grupo de control para el contenedor.', en: 'Specifies the control group for the container.' }
        },
        {
          long: '-f, --file',
          type: 'string',
          default: 'PATH/Dockerfile',
          level: 3,
          usage: 'docker buildx build -f FILE',
          nb: { es: 'Especifica la ubicación del Dockerfile.', en: 'Specifies the location of the Dockerfile.' }
        }
      ]
    },{
      command: 'du',
      usage: 'docker buildx du',
      result: { es: 'Uso del disco', en: 'Disk usage' },
      level: 2,
      nb: {
        es: 'Muestra el uso del disco por el constructor.',
        en: 'Shows disk usage by the builder.'
      },
      options: [
        {
          long: '--builder',
          type: 'string',
          level: 3,
          usage: 'docker buildx du --builder STRING',
          nb: { es: 'Especifica el nombre del constructor.', en: 'Specifies the name of the builder.' }
        },
        {
          long: '--filter',
          type: 'filter',
          level: 3,
          usage: 'docker buildx du --filter FILTER',
          nb: { es: 'Proporciona un filtro para el uso del disco.', en: 'Provides a filter for disk usage.' }
        },
        {
          long: '--verbose',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx du --verbose',
          nb: { es: 'Proporciona una salida más detallada.', en: 'Provides more detailed output.' }
        }
      ]
    },
    {
      command: 'inspect',
      usage: 'docker buildx inspect [NAME]',
      result: { es: 'Inspeccionar la instancia del constructor actual', en: 'Inspect current builder instance' },
      level: 2,
      nb: {
        es: 'Inspecciona la instancia del constructor actual.',
        en: 'Inspects the current builder instance.'
      },
      options: [
        {
          long: '--bootstrap',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx inspect --bootstrap',
          nb: { es: 'Inicializa el constructor si no está inicializado.', en: 'Bootstraps the builder if not initialized.' }
        },
        {
          long: '--builder',
          type: 'string',
          level: 3,
          usage: 'docker buildx inspect --builder STRING',
          nb: { es: 'Especifica el nombre del constructor.', en: 'Specifies the name of the builder.' }
        }
      ]
    },
    {
      command: 'ls',
      usage: 'docker buildx ls',
      result: { es: 'Listar instancias del constructor', en: 'List builder instances' },
      level: 2,
      nb: {
        es: 'Lista todas las instancias del constructor.',
        en: 'Lists all builder instances.'
      },
      options: []
    },
    {
      command: 'prune',
      usage: 'docker buildx prune [COMMAND]',
      result: { es: 'Eliminar caché de compilación', en: 'Remove build cache' },
      level: 2,
      nb: {
        es: 'Este comando se utiliza para eliminar la caché de compilación.',
        en: 'This command is used to remove the build cache.'
      },
      options: [
        {
          long: '--all',
          short: '-a',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx prune --all',
          nb: { es: 'Incluir imágenes internas/frontend', en: 'Include internal/frontend images' }
        },
        {
          long: '--builder',
          short: '',
          type: 'string',
          level: 3,
          usage: 'docker buildx prune --builder STRING',
          nb: { es: 'Anular la instancia del constructor configurado', en: 'Override the configured builder instance' }
        },
        {
          long: '--filter',
          short: '',
          type: 'string',
          level: 3,
          usage: 'docker buildx prune --filter FILTER',
          nb: { es: 'Proporcionar valores de filtro', en: 'Provide filter values' }
        },
        {
          long: '--force',
          short: '-f',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx prune --force',
          nb: { es: 'No pedir confirmación', en: 'Do not prompt for confirmation' }
        },
        {
          long: '--keep-storage',
          short: '',
          type: 'string',
          level: 3,
          usage: 'docker buildx prune --keep-storage BYTES',
          nb: { es: 'Cantidad de espacio en disco para mantener para la caché', en: 'Amount of disk space to keep for cache' }
        },
        {
          long: '--verbose',
          short: '',
          type: 'boolean',
          level: 3,
          usage: 'docker buildx prune --verbose',
          nb: { es: 'Proporcionar una salida más detallada', en: 'Provide a more verbose output' }
        }
      ]
    }
  ]
}.freeze

