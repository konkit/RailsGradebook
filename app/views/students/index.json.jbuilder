json.array!(@students) do |student|
  json.extract! student, :id, :name, :email, :division, :division_id
end
