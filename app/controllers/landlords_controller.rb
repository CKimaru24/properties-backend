class LandlordsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        landlords = Landlord.all
        render json: landlords, status: :ok
    end

    # POST /landlords
    # def create
    #   landlord = Landlord.create(landlord_params)
    #   if landlord.valid?
    #     render json: landlord, status: :created
    #   else
    #     render json: { errors: landlord.errors.full_messages }, status: :unprocessable_entity
    #   end
    # end

    def create
      @landlord = Landlord.new(landlord_params)
    
      if @landlord.save
        render json: @landlord, status: :created
      else
        render json: { errors: @landlord.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    
    
    private
  
    def landlord_params
      params.require(:landlord).permit(:fname, :lname, :email, :phone, :password, :password_confirmation)
    end
    

    def render_not_found_response
      render json: { error: "Landlord not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
