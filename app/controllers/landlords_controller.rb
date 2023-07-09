class LandlordsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    
    # skip_before_action :verify_authenticity_token, only: [:create, :update, :logout, :destroy]

    before_action :authenticate
    skip_before_action :authenticate, only: [:create]

    def index
        @landlords = Landlord.all
        render json: @landlords, status: :ok
    end

    def create
      landlord = Landlord.new(landlord_params)
  
      if landlord.save
        token = generate_token(landlord.id)
        render json: { landlord: landlord, token: token }, status: :created
      else
        render json: { error: 'Failed to submit landlord data' }, status: :unprocessable_entity
      end
    end

    def login
      @landlord = Landlord.find_by(email: landlord_params[:email])
      if @landlord && @landlord.authenticate(landlord_params[:password])
        token = generate_token({ landlord_id: @landlord.id })
        cookies.signed[:jwt] = { value: token, httponly: true }
        render json: { landlord: @landlord, token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
      end
    end

    # def logout
    #     cookies.delete(:jwt)
    #     head :no_content
    # end

    # def destroy
    #     @landlord = Landlord.find(params[:id])
    #     @landlord.destroy
    #     head :no_content
    # end
    
    private
  
    def landlord_params
      params.permit(:fname, :lname, :email, :phone, :password, :password_confirmation)
    end

    def render_not_found_response
      render json: { error: "Landlord not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
