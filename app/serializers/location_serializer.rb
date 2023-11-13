class LocationSerializer
  include JSONAPI::Serializer
  attributes :name, :country, :postcode
end
