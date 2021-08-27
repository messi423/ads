class AdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :user_id
  has_many :comments
end
