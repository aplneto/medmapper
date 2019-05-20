class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
    end

    def show
        @hospital = Hospital.find(params[:id].to_i)
    end

    def create
        hospital = Hospital.new(hospital_fetch_params)
        if hospital.save
            render json: hospital, status: 200
        else
            render json: hospital.errors, status: :unprocessable_entity
        end
    end

    def search
    end

end