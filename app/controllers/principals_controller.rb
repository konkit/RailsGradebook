class PrincipalsController < ApplicationController
  before_action :check_if_principal
  
  def subjects_and_divisions
    @subjects = Subject.includes(:divisions)
  end

  def get_grades
    @students = Student.get_student_grades_map(params[:division_id], params[:subject_id])
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
