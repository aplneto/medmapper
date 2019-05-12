class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
        render json: @hospitals, status: 200
    end

    def show
        @hospital = Hospital.find(params[:id].to_i)
        render json: @hospital, status: :success
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

    private

    def hospital_fetch_params
        params.permit(:id, :name, :telephone, :address, :neighborhood, :latitude,
            :longitude, :region, :micro_region, :nature, :specialties)
    end
end