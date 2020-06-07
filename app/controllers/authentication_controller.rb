class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render jason: { auth_token: command.result }
    else
      render jason: { error: command.errors }, status: :unauthorized
    end
  end
end
