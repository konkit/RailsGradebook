require 'rails_helper'

RSpec.describe PrincipalsController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  context "is authorized" do
    is_authorized

    describe "GET #subjects_and_divisions" do
      let!(:subjects) { FactoryGirl.create_list(:subject, 2) }

      before(:each) {   get :subjects_and_divisions, {format: :json}   }

      it "should show subjects lead by currently logged teacher" do
        expect(assigns(:subjects)).to match_array(subjects)
      end

      it "should render proper JSON response" do
        expect(response.body).to be_json_eql(subjects.to_json(:include => :divisions, :only => [:name, :divisions]))
      end
    end

    describe "GET #get_grades" do
      let!(:grades) { FactoryGirl.create_list(:grade, 2, student: student)}
      let!(:student) { FactoryGirl.create(:student) }
      let!(:student_grades_map) { [{ student: student, grades: grades }] }

      before(:each) do
        expect(Student).to receive(:get_student_grades_map).with(1, 2).and_return( student_grades_map )
        get :get_grades, { format: :json, division_id: 1, subject_id: 2}
      end

      it "should show grades from given division and subject" do
        expect(assigns(:students)).to eq(student_grades_map)
      end

      it "should return proper JSON" do
        expect(response.body).to be_json_eql(student_grades_map.to_json)
      end
    end

    describe "GET #grades_per_subject" do
      let(:subjectArray) { FactoryGirl.create_list(:subject, 2) }

      before(:each) do
        FactoryGirl.create_list(:grade, 2, subject: subjectArray[0])
        FactoryGirl.create(:grade, subject: subjectArray[1])

        get :grades_per_subject, {format: :json}
      end

      it "should return subjects and their grade counts" do
        expected = [
          [subjectArray[0], 2],
          [subjectArray[1], 1]
        ]
        expect(assigns(:grades_per_subject)).to match_array(expected)
      end

      it "should return proper JSON" do
        expectedJson = [
          { name: subjectArray[1].name, grades: 1 },
          { name: subjectArray[0].name, grades: 2 }
        ].to_json
        expect(response.body).to be_json_eql(expectedJson).in_any_order
      end
    end

    describe "GET #get_student_count_in_divisions" do
      let! (:divisions) { FactoryGirl.create_list(:division, 2) }

      before(:each) do
        get :get_student_count_in_divisions, {format: :json}
      end

      it "should return all divisions including students" do
        expect(assigns(:divisions)).to match_array(divisions)
      end

      it "should return proper JSON" do
        expectedJson = [
          { name: divisions[0].name, student_count: divisions[0].students.count },
          { name: divisions[0].name, student_count: divisions[0].students.count }
        ].to_json
        expect(response.body).to be_json_eql(expectedJson)
      end
    end
  end
end
