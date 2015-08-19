json.array!(@divisions) do |division|
  json.id division.id
  json.name division.name
  json.student_count division.students.count
end
