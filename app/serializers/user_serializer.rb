class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :password_digest
  has_many :ads
  has_many :comments
end
