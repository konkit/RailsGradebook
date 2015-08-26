require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  describe 'Student' do
    let(:student) { FactoryGirl.create(:student) }
    subject(:ability) { Ability.new(student) }

    it { is_expected.to be_able_to(:get_students_grades, student) }
    it { is_expected.to be_able_to(:change_password, student) }
  end

  describe 'Teacher' do
    let(:teacher) { FactoryGirl.create(:teacher) }
    subject(:ability) { Ability.new(teacher) }

    it { is_expected.to be_able_to(:subjects_and_divisions, teacher) }
    it { is_expected.to be_able_to(:get_grades, teacher) }

    let(:grade) do
      tmp_subject = FactoryGirl.create(:subject, teacher: teacher)
      FactoryGirl.create(:grade, subject: tmp_subject)
    end

    it { is_expected.to be_able_to(:manage, grade) }

    it { is_expected.to be_able_to(:view_reports, Report.new(user: teacher)) }
    it { is_expected.to be_able_to(:generate_reports, :all) }
  end

  describe 'Principal' do
    let(:principal) { FactoryGirl.create(:principal) }
    subject(:ability) { Ability.new(principal) }

    it { is_expected.to be_able_to(:manage, Teacher.new) }
    it { is_expected.to be_able_to(:manage, Student.new) }
    it { is_expected.to be_able_to(:manage, Division.new) }
    it { is_expected.to be_able_to(:manage, Subject.new) }
    it { is_expected.to be_able_to(:manage, Grade.new) }

    it { is_expected.to be_able_to(:principal_dashboard, :all) }

    it { is_expected.to be_able_to(:change_password, principal) }
  end
end
