json.extract! @teacher, :id, :name, :email
json.subjects @teacher.subjects.map do |subject|
  json.id subject.id
  json.name subject.name
end
