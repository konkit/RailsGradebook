json.array!(@divisions) do |division|
  json.extract! division, :id, :name, :subjects
end
