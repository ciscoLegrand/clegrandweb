class PagesController < ApplicationController
  layout 'frontend'

  def index
    @title = 'Bienvenidos a Clegrand webpage'
  end

  def docker
    file_path = Rails.root.join('db', 'docker_commands', 'primary.json')
    @primary_commands = JSON.parse(File.read(file_path))
    file_path_secondary = Rails.root.join('db', 'docker_commands', 'secondary.json')
    @secondary_commands = JSON.parse(File.read(file_path_secondary))
  end

  def contact; end
end