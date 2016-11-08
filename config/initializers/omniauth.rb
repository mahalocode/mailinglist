# frozen_string_literal: true
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
end
