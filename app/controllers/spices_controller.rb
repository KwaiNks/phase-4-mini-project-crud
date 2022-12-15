class SpicesController < ApplicationController

    def index
        spice = Spice.all
        render json: spice
    end

    def create
        spice = Spice.create(params_handler)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        if spice
            spice.update(params_handler)
            render json: spice
        end
    end

    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        end
    end

    private
    def params_handler
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end
end
