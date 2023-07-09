class ManagersController < ApplicationController
    before_action :current_landlord
    before_action :set_manager, only: [:show, :update, :destroy]
    
    # GET /managers
    def index
      managers = Manager.all
      render json: managers
    end
      
    # POST /managers
    def create
    # Output the manager_params for debugging
    puts manager_params.inspect
    
    # Log the current_landlord for debugging
    Rails.logger.debug("Current Landlord: #{current_landlord.inspect}")


    manager = current_landlord.managers.create(manager_params)

    if manager.save
      render json: manager, status: :created
    else
      Rails.logger.debug("Manager Errors: #{manager.errors.full_messages.join(', ')}")
      render json: { error: manager.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
    end

    # GET /managers/:id
    def show
      render json: @manager
    end
      
    # PATCH /managers/:id
    def update
      if @manager.update(manager_params)
        render json: @manager, status: :ok
        # render json: { message: 'Manager data updated successfully' }, status: :ok
      else
        # render json: { error: @manager.errors.full_messages.join(', ') }, status: :unprocessable_entity
        render :edit
      end
    end
      
    # DELETE /managers/:id
    def destroy
      @manager.destroy
      head :no_content
      # render json: { message: 'Manager deleted successfully' }
    end
      
    private
      
    def set_manager
      @manager = Manager.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Manager not found' }, status: :not_found
    end
    
    def manager_params
        params.require(:manager).permit(:fullname, :dob, :idnumber, :phonenumber, :emailaddress, :nssfnumber, :nhifnumber, :krapin, :listing_id, :propertyname, idimage: [:url, :name])
    end
end
