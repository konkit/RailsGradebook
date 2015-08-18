json.array! @grades
  .group_by { |grade| grade.student }
  .map { |student, grade|
    {
      student: {
        id: student.id,
        name: student.name,
        email: student.email
      },
      grades: grade
    }
  }
