class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
        render json: @hospitals, status: 200
    end

    def show
        @hospital = Hospital.find(params[:id].to_i)
        render json: @hospital, status: :success
    end

    def new
        @hospital = Hospital.new
    end

    def create
        # creation method
    end

    def search
    end
end