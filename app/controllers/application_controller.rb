class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format == Mime[:json] }
  
    # Before processing, set the request formats in current controller formats.
    def process_action(*)
      self.formats = request.formats&.filter_map(&:ref)
      super
    end

    # Generating tokens
    def generate_token(landlord_id)
      JWT.encode({ landlord_id: landlord_id }, 
      Rails.application.secrets.secret_key_base)
    end

    # Signing up or logging in
    def authenticate
      @landlord = Landlord.find_by(email: params[:email])
      if @landlord&.authenticate(params[:password])
        @token = generate_token(@landlord.id)
        render json: { token: @token }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized 
      end
    end

    # def authorized_user
    #   decoded_token = decode_token()
    #   if decoded_token
    #       landlord_id = decoded_token[0]['landlord_id']
    #       @landlord = Landlord.find_by(id: landlord_id)
    #   end
    # end

    private

    def current_landlord
      @current_landlord ||= authenticate_landlord_from_token
    end
  
    def authenticate_landlord_from_token
      token = request.headers['Authorization']&.split(' ')&.last
      return nil unless token
  
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      landlord_id = decoded_token[0]['landlord_id']
  
      Landlord.find_by(id: landlord_id)
    rescue JWT::DecodeError, JWT::ExpiredSignature
      nil
    end
  end
  
