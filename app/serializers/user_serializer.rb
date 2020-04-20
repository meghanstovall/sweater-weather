class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :api_token
end
