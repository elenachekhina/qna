# frozen_string_literal: true

class AuthorizationService
  attr_reader :auth
  def initialize(auth)
    @auth = auth
  end

  def call
    authorization = Authorization.find_by(auth_params)

    if authorization
      authorization.user
    else
      user = User.find_by(email: auth.info.email)
      unless user
        password = Devise.friendly_token[0, 20]
        user = User.create!(email: auth.info.email, password: password, password_confirmation: password)
      end
      user.authorizations.create(auth_params)
      user
    end
  end

  private

  def auth_params
    { provider: auth.provider, uid: auth.uid }
  end

end
