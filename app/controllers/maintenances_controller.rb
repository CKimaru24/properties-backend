class MaintenancesController < ApplicationController
    before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

    def index
        @maintenances = Maintenance.all
        render json: @maintenances
      end
    
      def create
        maintenance = Maintenance.new(maintenance_params)
    
        if maintenance.save
            render json: { message: 'Maintenance data submitted successfully' }, status: :created
        else
            render json: { error: 'Failed to submit maintenance data' }, status: :unprocessable_entity
        end
      end
  
      def show
          render json: @maintenance
        end
    
      def update
        if @maintenance.update(maintenance_params)
          redirect_to @maintenance, notice: 'Maintenance was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @maintenance.destroy
        redirect_to maintenances_url, notice: 'Maintenance was successfully destroyed.'
      end
    
      private
    
      def set_maintenance
        @maintenance = Maintenance.find(params[:id])
      end
  
      def maintenance_params
          params.require(:maintenance).permit(:item, :details, images: [:url, :name])
      end
end
