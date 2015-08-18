json.array!(@grades_per_subject) do |key, value|
  json.name key.name
  json.grades value
end
