class HospitalsController < ApplicationController
    include GeneralModelHelper
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
            redirect_to hospital_path(@hospital.id),
            :notice => 'Novo hospital cadastrado com sucesso'
        else
            render 'new', @hospital.errors
        end
    end

    def filter
        @hospital = Hospital.new
    end

    def filter_results
        multi_tag_search(params[:hospital], Hospital)
    end

end