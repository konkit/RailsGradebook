json.extract! @student, :id, :name, :email, :division, :division_id
json.grades_by_subject @grades.map do |subject, grades|
  json.subject subject
  json.grades grades.map(&:gradevalue)
end
