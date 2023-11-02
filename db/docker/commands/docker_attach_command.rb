docker_attach_command = {
  tech: 'docker',
  command: 'attach',
  usage: 'docker attach [OPTIONS] CONTAINER',
  result: { es: 'Adjunta la entrada estándar local, salida y streams de error a un contenedor en ejecución', en: 'Attach local standard input, output, and error streams to a running container' },
  level: 1,
  options: [
    { long: '--detach-keys', type: 'string', level: 2 },
    { long: '--no-stdin', type: 'boolean', level: 2 },
    { long: '--sig-proxy', type: 'boolean', default: true, level: 2 }
  ],
  nb: {
    es: 'Utilice CONTAINER para especificar el contenedor al que desea adjuntar.',
    en: 'Use CONTAINER to specify which container to attach to.'
  }
}
