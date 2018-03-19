Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :wechat, $env['OMNIAUTH']['WECHAT']['APP_ID'], $env['OMNIAUTH']['WECHAT']['APP_SECRET']
  provider :facebook, $env['omniauth']['facebook']['key'], $env['omniauth']['facebook']['secret'], scope: 'public_profile,email', callback_url: $env['omniauth']['facebook']['callback_url']
end