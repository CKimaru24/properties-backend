# # lib/json_web_token.rb
# module JsonWebToken
#     SECRET_KEY = Rails.application.secrets.secret_key_base || 'default_secret_key'
  
#     def self.encode(payload)
#       JWT.encode(payload, SECRET_KEY)
#     end
  
#     def self.decode(token)
#       decoded_token = JWT.decode(token, SECRET_KEY)[0]
#       HashWithIndifferentAccess.new(decoded_token)
#     rescue JWT::DecodeError
#       nil
#     end
#   end
  
class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base
  
    def self.encode(payload, expiration = 24.hours.from_now)
      payload[:exp] = expiration.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new(decoded)
    rescue JWT::DecodeError, JWT::ExpiredSignature
      nil
    end
end
  