class SessionsController < ApplicationController
    def create
      landlord = Landlord.find_by(email: params[:email])
  
      if landlord&.authenticate(params[:password])
        token = generate_token.encode(landlord_id: landlord.id)
        render json: { token: token }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
  