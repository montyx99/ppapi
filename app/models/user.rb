class User
    include Mongoid::Document
    include Mongoid::Timestamps
    field :discord_id, type: String
    field :username, type: String
    field :discriminator, type: String
    field :avatar, type: String
    field :email, type: String
    field :locale, type: String
    embeds_one :tokenStore
    accepts_nested_attributes_for :tokenStore
    validates_presence_of :discord_id
    index({ discord_id: 1 }, { unique: true, background: true })

    def self.create_with_omniauth(auth)
        create! do |user|
            user.avatar = auth.extra.raw_info.avatar
            user.discriminator = auth.extra.raw_info.discriminator
            user.email = auth.extra.raw_info.email
            user.discord_id = auth.extra.raw_info.id
            user.locale = auth.extra.raw_info.locale
            user.username = auth.extra.raw_info.username
            user.attributes = {
                tokenStore_attributes: {
                    authToken: auth.credentials.token,
                    refreshToken: auth.credentials.refreshToken,
                    expires: auth.credentials.expires,
                    expiresAt: Time.at(auth.credentials.expires_at.to_i).to_datetime
                }
            }
        end
	end
end
