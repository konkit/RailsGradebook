json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email
end
