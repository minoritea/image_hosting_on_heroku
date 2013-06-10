class Image
  include Mongoid::Document
  field :title, type: String
  field :image, type: Moped::BSON::Binary
  field :uploaded_at, type: Time, default: ->{ Time.now }
end
