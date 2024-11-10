class ApplicationController < ActionController::API
  include Pundit
  before_action :authorize_request

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decode_token
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ')[1] if auth_header
    if token
      begin
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
        puts "Decoded token: #{decoded.inspect}"  # Debug line
        return decoded
      rescue JWT::DecodeError => e
        puts "JWT Decode Error: #{e.message}"  # Debug line
        nil
      end
    end
  end

  def current_user
    @current_user ||= begin
      decoded = decode_token
      if decoded
        user_id = decoded[0]['user_id']
        user = User.find_by(id: user_id)
        puts "Current user: #{user.inspect}"  # Debug line
        user
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authorize_request
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
