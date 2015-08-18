json.array! @student.grades
  .group_by { |grade| grade.subject }
  .map { |subject, grades|
    {
      student: { id: @student.id, name: @student.name},
      subject: { name: subject.name, id: subject.id},
      grades: grades.map { |grade|
        {
          id: grade.id, value: grade.gradevalue
        }
      }
    }
  }
