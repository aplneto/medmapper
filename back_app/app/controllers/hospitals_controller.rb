class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
    end

    def show
        @hospital = Hospital.find(params[:id].to_i)
    end

    def new
        @hospital = Hospital.new
    end

    def create
        @hospital = Hospital.new(params[:hospital])
        if @hospital.save
            redirect_to hospitals_path, :notice => "Cadastro efetuado com sucesso"
        else
            # render 'new'
        end
    end
end