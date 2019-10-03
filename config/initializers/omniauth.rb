Ppapi::Application.config.middleware.use OmniAuth::Builder do
    provider :discord, ENV["DISCORD_CLIENT_ID"], ENV["DISCORD_CLIENT_SECRET"], scope: 'email identify'
end