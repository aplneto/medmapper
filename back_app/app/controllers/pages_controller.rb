class PagesController < ApplicationController
    def home
    end

    def about
      render 'about.html'
    end

    def collaborators
      render 'colaboradores.html'
    end

    def developers
      render 'desenvolvedores.html'
    end
  end