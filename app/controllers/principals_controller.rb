class PrincipalsController < ApplicationController
  before_action :check_if_principal

  def subjects_and_divisions
    render json: subjects = Subject.includes(:divisions).as_json(:include => :divisions)
  end

  def get_grades
    @students = Student.includes(:grades).where(division_id: params[:division_id]).map do |student|
      {
        student: student,
        grades: student.grades.where(subject_id: params[:subject_id])
      }
    end
  end

  def grades_per_subject
    @grades_per_subject = Grade.includes(:subject).all.group(:subject).count
  end

  def get_student_count_in_divisions
    @divisions = Division.includes(:students).all
  end

  private
    def check_if_principal
      authorize! :principal_dashboard, current_user
    end
end
