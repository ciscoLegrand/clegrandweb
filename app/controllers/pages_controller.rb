class PagesController < ApplicationController
  layout 'frontend'

  def index
    @title = 'Bienvenidos a Clegrand webpage'
  end

  def docker
    data = []
    ['build_command', 'run_command', 'ps_command'].each do |file|
      file_path = Rails.root.join('db', 'docker_commands', 'basics', "#{file}.json")
      document_initializer = DocumentReader::DocumentInitializer.new(file_path)
      data << document_initializer.read
    end
    @first_level = data.map { |d| d.dig('command', 'first_level') }
  
    selected_command = params[:command]
    if selected_command.present?
      selected_data = data.find { |d| d.dig('command', 'first_level', 'value') == selected_command }
      @second_level = selected_data.dig('command', 'second_level')
    else
      @second_level = []
    end
  
    respond_to do |format|
      format.html
      format.json { render json: { first_level: @first_level, second_level: @second_level } }
    end
  end

  def contact; end
end