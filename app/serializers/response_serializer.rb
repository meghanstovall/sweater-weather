class ResponseSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :status, :message, :errors
end
