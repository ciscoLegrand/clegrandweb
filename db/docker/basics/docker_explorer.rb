docker_commands = [
  {
    category: 'Image Management',
    commands: [
      {
        tech: 'docker',
        command: 'build',
        label: {
          es: 'Construir una imagen a partir de un Dockerfile',
          en: 'Build an image from a Dockerfile'
        },
        usage: 'docker build -t <image name>:<tag> <path to Dockerfile>',
        level: 1,
        options: []
      }
    ]
  },
  {
    category: 'Container Lifecycle',
    commands: [
      {
        tech: 'docker',
        command: 'run',
        label: {
          es: 'Ejecutar un contenedor desde una imagen',
          en: 'Run a container from an image'
        },
        usage: 'docker run <options> <image name>',
        level: 1,
        options: [
          {
            value: 'port',
            label: {
              es: 'Mapear puertos entre el host y el contenedor',
              en: 'Port mapping between host and container'
            },
            usage: 'docker run -p <host port>:<container port> <image name>'
          },
          {
            value: 'volume',
            label: {
              es: 'Mapear volúmenes entre el host y el contenedor',
              en: 'Volume mapping between host and container'
            },
            usage: 'docker run -v <host dir>:<container dir> <image name>'
          },
          {
            value: 'detach',
            label: {
              es: 'Ejecutar el contenedor en segundo plano',
              en: 'Run the container in the background'
            },
            usage: 'docker run -d <image name>'
          }
        ]
      },
      {
        tech: 'docker',
        command: 'ps',
        label: {
          es: 'Listar contenedores en ejecución',
          en: 'List running containers'
        },
        usage: 'docker ps',
        level: 1,
        options: [
          {
            value: 'all',
            label: {
              es: 'Listar todos los contenedores',
              en: 'List all containers'
            },
            usage: 'docker ps -a'
          },
          {
            value: 'latest',
            label: {
              es: 'Mostrar el último contenedor creado',
              en: 'Show the latest created container'
            },
            usage: 'docker ps -l'
          }
        ]
      },
      {
        tech: 'docker',
        command: 'stop',
        label: {
          es: 'Detener uno o más contenedores en ejecución',
          en: 'Stop one or more running containers'
        },
        usage: 'docker stop <container ID>',
        level: 1,
        options: [
          {
            value: 'time',
            label: {
              es: 'Tiempo de espera antes de detener',
              en: 'Time to wait before stopping'
            },
            usage: 'docker stop -t <seconds> <container ID>'
          }
        ]
      }
    ]
  },
  {
    category: 'Container Operations',
    commands: [
      {
        tech: 'docker',
        command: 'exec',
        label: {
          es: 'Ejecutar un comando en un contenedor en ejecución',
          en: 'Run a command in a running container'
        },
        usage: 'docker exec <options> <container ID> <command>',
        level: 1,
        options: [
          {
            value: 'interactive',
            label: {
              es: 'Modo interactivo',
              en: 'Interactive mode'
            },
            usage: 'docker exec -it <container ID> /bin/bash'
          }
        ]
      }
    ]
  }
]
