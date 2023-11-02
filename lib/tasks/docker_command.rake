
namespace :docker_commands do
  DOCKER = [
    { tech: 'docker', command: 'attach', usage: 'docker attach [OPTIONS] CONTAINER', result: { es: 'Adjunta la entrada, salida y errores estándar locales a un contenedor en ejecución', en: 'Attach local standard input, output, and error streams to a running container' }, level: 1 },
    { tech: 'docker', command: 'build', usage: 'docker build [OPTIONS] PATH | URL | -', result: { es: 'Construye una imagen a partir de un Dockerfile', en: 'Build an image from a Dockerfile' }, level: 1 },
    { tech: 'docker', command: 'builder', usage: 'docker builder [OPTIONS]', result: { es: 'Administra las compilaciones', en: 'Manage builds' }, level: 1 },
    { tech: 'docker', command: 'checkpoint', usage: 'docker checkpoint [OPTIONS]', result: { es: 'Administra puntos de control', en: 'Manage checkpoints' }, level: 1 },
    { tech: 'docker', command: 'commit', usage: 'docker commit [OPTIONS] CONTAINER', result: { es: 'Crea una nueva imagen a partir de los cambios de un contenedor', en: 'Create a new image from a container\'s changes' }, level: 1 },
    { tech: 'docker', command: 'config', usage: 'docker config [OPTIONS]', result: { es: 'Administra las configuraciones de Swarm', en: 'Manage Swarm configs' }, level: 1 },
    { tech: 'docker', command: 'container', usage: 'docker container [OPTIONS]', result: { es: 'Administra contenedores', en: 'Manage containers' }, level: 1 },
    { tech: 'docker', command: 'context', usage: 'docker context [OPTIONS]', result: { es: 'Administra contextos', en: 'Manage contexts' }, level: 1 },
    { tech: 'docker', command: 'cp', usage: 'docker cp [OPTIONS] CONTAINER:PATH', result: { es: 'Copia archivos/carpetas entre un contenedor y el sistema de archivos local', en: 'Copy files/folders between a container and the local filesystem' }, level: 1 },
    { tech: 'docker', command: 'create', usage: 'docker create [OPTIONS] IMAGE [COMMAND]', result: { es: 'Crea un nuevo contenedor', en: 'Create a new container' }, level: 1 },
    { tech: 'docker', command: 'diff', usage: 'docker diff CONTAINER', result: { es: 'Inspecciona los cambios en archivos o directorios en el sistema de archivos de un contenedor', en: 'Inspect changes to files or directories on a container\'s filesystem' }, level: 1 },
    { tech: 'docker', command: 'events', usage: 'docker events [OPTIONS]', result: { es: 'Obtiene eventos en tiempo real del servidor', en: 'Get real time events from the server' }, level: 1 },
    { tech: 'docker', command: 'exec', usage: 'docker exec [OPTIONS] CONTAINER COMMAND', result: { es: 'Ejecuta un comando en un contenedor en ejecución', en: 'Execute a command in a running container' }, level: 1 },
    { tech: 'docker', command: 'export', usage: 'docker export [OPTIONS] CONTAINER', result: { es: 'Exporta el sistema de archivos de un contenedor como un archivo tar', en: 'Export a container\'s filesystem as a tar archive' }, level: 1 },
    { tech: 'docker', command: 'history', usage: 'docker history [OPTIONS] IMAGE', result: { es: 'Muestra el historial de una imagen', en: 'Show the history of an image' }, level: 1 },
    { tech: 'docker', command: 'image', usage: 'docker image [OPTIONS]', result: { es: 'Administra imágenes', en: 'Manage images' }, level: 1 },
    { tech: 'docker', command: 'images', usage: 'docker images [OPTIONS] [REPOSITORY]', result: { es: 'Lista imágenes', en: 'List images' }, level: 1 },
    { tech: 'docker', command: 'import', usage: 'docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]', result: { es: 'Importa el contenido de un archivo tar para crear una imagen de sistema de archivos', en: 'Import the contents from a tarball to create a filesystem image' }, level: 1 },
    { tech: 'docker', command: 'info', usage: 'docker info [OPTIONS]', result: { es: 'Muestra información del sistema', en: 'Display system-wide information' }, level: 1 },
    { tech: 'docker', command: 'inspect', usage: 'docker inspect [OPTIONS] NAME|ID [NAME|ID...]', result: { es: 'Devuelve información de bajo nivel sobre objetos Docker', en: 'Return low-level information on Docker objects' }, level: 1 },
    { tech: 'docker', command: 'kill', usage: 'docker kill [OPTIONS] CONTAINER', result: { es: 'Mata uno o más contenedores en ejecución', en: 'Kill one or more running containers' }, level: 1 },
    { tech: 'docker', command: 'load', usage: 'docker load [OPTIONS] file|URL|-', result: { es: 'Carga una imagen desde un archivo tar o STDIN', en: 'Load an image from a tar archive or STDIN' }, level: 1 },
    { tech: 'docker', command: 'login', usage: 'docker login [OPTIONS] SERVER', result: { es: 'Iniciar sesión en un registro', en: 'Log in to a registry' }, level: 1 },
    { tech: 'docker', command: 'logout', usage: 'docker logout [OPTIONS] SERVER', result: { es: 'Cerrar sesión en un registro', en: 'Log out from a registry' }, level: 1 },
    { tech: 'docker', command: 'logs', usage: 'docker logs [OPTIONS] CONTAINER', result: { es: 'Obtiene los registros de un contenedor', en: 'Fetch the logs of a container' }, level: 1 },
    { tech: 'docker', command: 'manifest', usage: 'docker manifest [OPTIONS]', result: { es: 'Administra manifiestos de imágenes Docker y listas de manifiestos', en: 'Manage Docker image manifests and manifest lists' }, level: 1 },
    { tech: 'docker', command: 'network', usage: 'docker network [OPTIONS]', result: { es: 'Administra redes', en: 'Manage networks' }, level: 1 },
    { tech: 'docker', command: 'node', usage: 'docker node [OPTIONS]', result: { es: 'Administra nodos de Swarm', en: 'Manage Swarm nodes' }, level: 1 },
    { tech: 'docker', command: 'pause', usage: 'docker pause CONTAINER', result: { es: 'Pausa todos los procesos dentro de uno o más contenedores', en: 'Pause all processes within one or more containers' }, level: 1 },
    { tech: 'docker', command: 'plugin', usage: 'docker plugin [OPTIONS]', result: { es: 'Administra plugins', en: 'Manage plugins' }, level: 1 },
    { tech: 'docker', command: 'port', usage: 'docker port [OPTIONS] CONTAINER', result: { es: 'Lista mapeos de puerto o un mapeo específico para el contenedor', en: 'List port mappings or a specific mapping for the container' }, level: 1 },
    { tech: 'docker', command: 'ps', usage: 'docker ps [OPTIONS]', result: { es: 'Lista contenedores', en: 'List containers' }, level: 1 },
    { tech: 'docker', command: 'pull', usage: 'docker pull [OPTIONS] NAME[:TAG]', result: { es: 'Descarga una imagen de un registro', en: 'Download an image from a registry' }, level: 1 },
    { tech: 'docker', command: 'push', usage: 'docker push [OPTIONS] NAME[:TAG]', result: { es: 'Sube una imagen a un registro', en: 'Upload an image to a registry' }, level: 1 },
    { tech: 'docker', command: 'rename', usage: 'docker rename CONTAINER NEW_NAME', result: { es: 'Renombra un contenedor', en: 'Rename a container' }, level: 1 },
    { tech: 'docker', command: 'restart', usage: 'docker restart [OPTIONS] CONTAINER', result: { es: 'Reinicia uno o más contenedores', en: 'Restart one or more containers' }, level: 1 },
    { tech: 'docker', command: 'rm', usage: 'docker rm [OPTIONS] CONTAINER', result: { es: 'Elimina uno o más contenedores', en: 'Remove one or more containers' }, level: 1 },
    { tech: 'docker', command: 'rmi', usage: 'docker rmi [OPTIONS] IMAGE', result: { es: 'Elimina una o más imágenes', en: 'Remove one or more images' }, level: 1 },
    { tech: 'docker', command: 'run', usage: 'docker run [OPTIONS] IMAGE [COMMAND]', result: { es: 'Crea y ejecuta un nuevo contenedor a partir de una imagen', en: 'Create and run a new container from an image' }, level: 1 },
    { tech: 'docker', command: 'save', usage: 'docker save [OPTIONS] IMAGE', result: { es: 'Guarda una o más imágenes en un archivo tar', en: 'Save one or more images to a tar archive' }, level: 1 },
    { tech: 'docker', command: 'search', usage: 'docker search [OPTIONS] TERM', result: { es: 'Busca en Docker Hub imágenes', en: 'Search Docker Hub for images' }, level: 1 },
    { tech: 'docker', command: 'secret', usage: 'docker secret [OPTIONS]', result: { es: 'Administra secretos de Swarm', en: 'Manage Swarm secrets' }, level: 1 },
    { tech: 'docker', command: 'service', usage: 'docker service [OPTIONS]', result: { es: 'Administra servicios de Swarm', en: 'Manage Swarm services' }, level: 1 },
    { tech: 'docker', command: 'stack', usage: 'docker stack [OPTIONS]', result: { es: 'Administra pilas de Swarm', en: 'Manage Swarm stacks' }, level: 1 },
    { tech: 'docker', command: 'start', usage: 'docker start [OPTIONS] CONTAINER', result: { es: 'Inicia uno o más contenedores detenidos', en: 'Start one or more stopped containers' }, level: 1 },
    { tech: 'docker', command: 'stats', usage: 'docker stats [OPTIONS] [CONTAINER]', result: { es: 'Muestra un flujo en vivo de las estadísticas de uso de recursos de contenedor(es)', en: 'Display a live stream of container(s) resource usage statistics' }, level: 1 },
    { tech: 'docker', command: 'stop', usage: 'docker stop [OPTIONS] CONTAINER', result: { es: 'Detiene uno o más contenedores en ejecución', en: 'Stop one or more running containers' }, level: 1 },
    { tech: 'docker', command: 'swarm', usage: 'docker swarm [OPTIONS]', result: { es: 'Administra Swarm', en: 'Manage Swarm' }, level: 1 },
    { tech: 'docker', command: 'system', usage: 'docker system [OPTIONS]', result: { es: 'Administra Docker', en: 'Manage Docker' }, level: 1 },
    { tech: 'docker', command: 'tag', usage: 'docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]', result: { es: 'Crea una etiqueta TARGET_IMAGE que se refiere a SOURCE_IMAGE', en: 'Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE' }, level: 1 },
    { tech: 'docker', command: 'top', usage: 'docker top [OPTIONS] CONTAINER [ps OPTIONS]', result: { es: 'Muestra los procesos en ejecución de un contenedor', en: 'Display the running processes of a container' }, level: 1 },
    { tech: 'docker', command: 'trust', usage: 'docker trust [OPTIONS]', result: { es: 'Administra la confianza en imágenes Docker', en: 'Manage trust on Docker images' }, level: 1 },
    { tech: 'docker', command: 'unpause', usage: 'docker unpause [OPTIONS] CONTAINER', result: { es: 'Reanuda todos los procesos dentro de uno o más contenedores', en: 'Unpause all processes within one or more containers' }, level: 1 },
    { tech: 'docker', command: 'update', usage: 'docker update [OPTIONS] CONTAINER', result: { es: 'Actualiza la configuración de uno o más contenedores', en: 'Update configuration of one or more containers' }, level: 1 },
    { tech: 'docker', command: 'version', usage: 'docker version [OPTIONS]', result: { es: 'Muestra información sobre la versión de Docker', en: 'Show the Docker version information' }, level: 1 },
    { tech: 'docker', command: 'volume', usage: 'docker volume [OPTIONS]', result: { es: 'Administra volúmenes', en: 'Manage volumes' }, level: 1 },
    { tech: 'docker', command: 'wait', usage: 'docker wait [OPTIONS] CONTAINER', result: { es: 'Bloquea hasta que uno o más contenedores se detengan y luego imprime su(s) código(s) de salida', en: 'Block until one or more containers stop, then print their exit codes' }, level: 1 }
  ];

  GIT = [
    { tech: 'git', command: 'add', usage: 'git add [OPTIONS] [PATHSPEC]', result: { es: 'Agrega cambios en el directorio de trabajo al área de preparación para el próximo commit', en: 'Add changes in the working directory to the staging area for the next commit' }, leve: 1 },
    { tech: 'git', command: 'bisect', usage: 'git bisect [OPTIONS]', result: { es: 'Utiliza la búsqueda binaria para encontrar el commit que introdujo un error', en: 'Use binary search to find the commit that introduced a bug' }, leve: 1 },
    { tech: 'git', command: 'branch', usage: 'git branch [OPTIONS] [BRANCH_NAME]', result: { es: 'Lista, crea o borra ramas', en: 'List, create, or delete branches' }, leve: 1 },
    { tech: 'git', command: 'checkout', usage: 'git checkout [OPTIONS] [BRANCH]', result: { es: 'Cambia ramas o restaura archivos del árbol de trabajo', en: 'Switch branches or restore working tree files' }, leve: 1 },
    { tech: 'git', command: 'clone', usage: 'git clone [OPTIONS] REPOSITORY [DIRECTORY]', result: { es: 'Clona un repositorio en un nuevo directorio', en: 'Clone a repository into a new directory' }, leve: 1 },
    { tech: 'git', command: 'commit', usage: 'git commit [OPTIONS]', result: { es: 'Registra cambios en el repositorio', en: 'Record changes to the repository' }, leve: 1 },
    { tech: 'git', command: 'config', usage: 'git config [OPTIONS]', result: { es: 'Obtiene y establece variables de configuración de Git', en: 'Get and set Git configuration variables' }, leve: 1 },
    { tech: 'git', command: 'diff', usage: 'git diff [OPTIONS] [COMMIT]', result: { es: 'Muestra cambios entre commits, commit y área de preparación, etc', en: 'Show changes between commits, commit and working tree, etc' }, leve: 1 },
    { tech: 'git', command: 'fetch', usage: 'docker fetch [OPTIONS] [REPOSITORY]', result: { es: 'Descarga objetos y referencias de otro repositorio', en: 'Download objects and refs from another repository' }, leve: 1 },
    { tech: 'git', command: 'grep', usage: 'git grep [OPTIONS] PATTERN', result: { es: 'Imprime líneas que coinciden con un patrón', en: 'Print lines matching a pattern' }, leve: 1 },
    { tech: 'git', command: 'init', usage: 'git init [OPTIONS]', result: { es: 'Crea un nuevo repositorio Git o reinicializa uno existente', en: 'Create a new Git repository or reinitialize an existing one' }, leve: 1 },
    { tech: 'git', command: 'log', usage: 'git log [OPTIONS]', result: { es: 'Muestra el historial de commits', en: 'Show the commit logs' }, leve: 1 },
    { tech: 'git', command: 'merge', usage: 'git merge [OPTIONS] [BRANCH]', result: { es: 'Combina dos o más historias de desarrollo juntas', en: 'Join two or more development histories together' }, leve: 1 },
    { tech: 'git', command: 'mv', usage: 'git mv [OPTIONS] SOURCE DEST', result: { es: 'Mueve o renombra un archivo, un directorio o un enlace simbólico', en: 'Move or rename a file, a directory, or a symlink' }, leve: 1 },
    { tech: 'git', command: 'pull', usage: 'git pull [OPTIONS] [REPOSITORY]', result: { es: 'Descarga cambios y actualiza el repositorio local para que coincida con el remoto', en: 'Fetch from and integrate with another repository or a local branch' }, leve: 1 },
    { tech: 'git', command: 'push', usage: 'git push [OPTIONS] [REPOSITORY]', result: { es: 'Actualiza referencias remotas junto con objetos asociados', en: 'Update remote refs along with associated objects' }, leve: 1 },
    { tech: 'git', command: 'rebase', usage: 'git rebase [OPTIONS]', result: { es: 'Reaplica cambios de commits en otra rama', en: 'Reapply changes from commits onto another branch' }, leve: 1 },
    { tech: 'git', command: 'reset', usage: 'git reset [OPTIONS] [COMMIT]', result: { es: 'Restablece el HEAD actual a un estado especificado', en: 'Reset current HEAD to the specified state' }, leve: 1 },
    { tech: 'git', command: 'rm', usage: 'git rm [OPTIONS] FILE', result: { es: 'Elimina archivos del árbol de trabajo y del índice', en: 'Remove files from the working tree and from the index' }, leve: 1 },
    { tech: 'git', command: 'show', usage: 'git show [OPTIONS] [COMMIT]', result: { es: 'Muestra información sobre objetos Git', en: 'Show information about Git objects' }, leve: 1 },
    { tech: 'git', command: 'status', usage: 'git status [OPTIONS]', result: { es: 'Muestra el estado del árbol de trabajo', en: 'Show the working tree status' }, leve: 1 },
    { tech: 'git', command: 'tag', usage: 'git tag [OPTIONS] [TAG_NAME]', result: { es: 'Crea, lista, elimina o verifica un tag firmado con GPG', en: 'Create, list, delete or verify a tag object signed with GPG' }, leve: 1 }
  ]

  GITADD = [
    {
      tech: 'git',
      command: 'add',
      value: 'update',
      flag: { long: '--update', short: '-u' },
      usage: 'git add -u',
      result: { es: 'Actualizar el archivo rastreado en el área de preparación', en: 'Update tracked files in the staging area' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'all',
      flag: { long: '--all', short: '-A' },
      usage: 'git add -A',
      result: { es: 'Añadir todos los archivos nuevos y modificados al área de preparación', en: 'Add all new and modified files to the staging area' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'interactive',
      flag: { long: '--interactive', short: '-i' },
      usage: 'git add -i',
      result: { es: 'Agregar archivos de forma interactiva', en: 'Add files interactively' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'patch',
      flag: { long: '--patch', short: '-p' },
      usage: 'git add -p',
      result: { es: 'Elegir interactivamente fragmentos de archivo para agregar al área de preparación', en: 'Interactively choose hunks of patch to stage' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'dry-run',
      flag: { long: '--dry-run', short: 'null' },
      usage: 'git add --dry-run',
      result: { es: 'Mostrar lo que se ejecutaría pero sin confirmar los cambios', en: 'Show what would be done, without making any changes' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'ignore-removal',
      flag: { long: '--ignore-removal', short: 'null' },
      usage: 'git add --ignore-removal .',
      result: { es: 'Ignorar archivos que se han eliminado desde el directorio de trabajo', en: 'Ignore files that have been removed from the working directory' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'force',
      flag: { long: '--force', short: '-f' },
      usage: 'git add -f <file>',
      result: { es: 'Permitir agregar archivos ignorados', en: 'Allow adding ignored files' },
      nb: { es: 'Reemplace <file> con el archivo que desea forzar a añadir.', en: 'Replace <file> with the file you wish to force add.' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'edit',
      flag: { long: '--edit', short: '-e' },
      usage: 'git add -e',
      result: { es: 'Abrir un editor para editar el índice', en: 'Open an editor to edit the index' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'ignore-errors',
      flag: { long: '--ignore-errors', short: 'null' },
      usage: 'git add --ignore-errors',
      result: { es: 'Ignorar errores al agregar archivos al índice', en: 'Ignore errors when adding files to the index' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'intent-to-add',
      flag: { long: '--intent-to-add', short: '-N' },
      usage: 'git add -N',
      result: { es: 'Registrar solo la intención de añadir el archivo, no el contenido', en: 'Record only the fact that the path will be added later' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'refresh',
      flag: { long: '--refresh', short: 'null' },
      usage: 'git add --refresh',
      result: { es: 'Actualizar el índice sin cambiar nada', en: 'Refresh only don\'t add, ignore any changed contents' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'quiet',
      flag: { long: '--quiet', short: '-q' },
      usage: 'git add -q',
      result: { es: 'No mostrar mensajes de estado', en: 'Suppress summary message' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'verbose',
      flag: { long: '--verbose', short: 'null' },
      usage: 'git add --verbose',
      result: { es: 'Ser verboso sobre qué archivos se están añadiendo', en: 'Be verbose about what files are being added' },
      level: 2
    },
    {
      tech: 'git',
      command: 'add',
      value: 'chmod',
      flag: { long: '--chmod', short: 'null' },
      usage: 'git add --chmod=+x <file>',
      result: { es: 'Cambiar el bit de permiso ejecutable del archivo', en: 'Override the executable permission bit of the listed files' },
      nb: { es: 'Reemplace <file> con el archivo cuyo bit de permiso desea cambiar.', en: 'Replace <file> with the file whose permission bit you want to change.' },
      level: 2
    }
  ]
  desc "Generate a JSON file from the array of Docker commands"
  task :generate_json, [:tech] => :environment do |t, args|
    File.open("db/#{args[:tech]}/first_level.json","w") do |f|
      f.write(JSON.pretty_generate(eval(args[:tech].upcase)))
    end
    puts "JSON file has been generated at db/#{args[:tech]}/first_level.json"
  end
end
