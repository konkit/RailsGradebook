json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :teacher_id
  json.teacher subject.teacher, :id, :name
end
