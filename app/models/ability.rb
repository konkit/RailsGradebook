class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    user ||= User.new # guest user (not logged in)
    if user.is_a? Teacher
      init_teacher_abilities(user)
    elsif user.is_a? Student
      init_student_abilities(user)
    elsif user.is_a? Principal
      init_principal_abilities(user)
    else
      cannot :manage, :all
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  def init_teacher_abilities(user)
    # Teacher can manage the Grades of the subjects he is involved
    can :manage, Grade, :subject => { :teacher => user }

    can :subjects_and_divisions, Teacher, :id => user.id
    can :get_grades, Teacher, :id => user.id

    can :get_reports, Teacher, :id => user.id
    can :view_reports, Report, :user => user
    can :generate_reports, :all
  end


  def init_student_abilities(user)
    # Student can see his own grades
    can :get_students_grades, Student, :id => user.id

    can :change_password, Student, :id => user.id
  end


  def init_principal_abilities(user)
    # Principal can manage Teachers and Students
    can :manage, [Teacher, Student, Division, Subject, Grade]

    can :principal_dashboard, :all

    # Principal can change his password
    can :change_password, Principal, :id => user.id
  end
end
