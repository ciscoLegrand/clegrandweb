module Frontend
  class PagesController < ApplicationController
    layout 'frontend'

    def index
      @title = 'Bienvenidos a Clegrand webpage'
    end
  end
end