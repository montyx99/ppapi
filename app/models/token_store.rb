class TokenStore
    include Mongoid::Document
    include Mongoid::Timestamps
    field :authToken, type: String
    field :refreshToken, type: String
    field :expires, type: Boolean
    field :expiresAt, type: DateTime

    embedded_in :user
end