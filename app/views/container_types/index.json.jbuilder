json.array!(@container_types) do |container_type|
  json.extract! container_type, :id, :name, :icon
  json.url container_type_url(container_type, format: :json)
end
