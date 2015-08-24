json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :divisions
end
