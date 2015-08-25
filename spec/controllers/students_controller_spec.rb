require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  let(:student) { FactoryGirl.create(:student) }
  let(:student_template) { FactoryGirl.build(:student) }

  let(:valid_attributes) {
    {
      name: student_template.name,
      email: student_template.email,
      role: student_template.role,
      password: student_template.password,
      password_confirmation: student_template.password_confirmation,
      division_id: student_template.division.id
    }
  }

  let(:invalid_attributes) {
    {
      name: student_template.name,
      email: 'asdf',
      role: student_template.role,
      password: student_template.password,
      password_confirmation: student_template.password_confirmation+'a',
      division_id: student_template.division.id
    }
  }

  context "is authorized" do
    is_authorized

    describe "GET #get_students_grades" do
      it "should set student as @student" do
        expect(controller).to receive(:current_user).at_least(:once).and_return( student )
        expect(controller).to receive(:authorize!).with(:get_students_grades, student).and_return( true )
        expect(Student).to receive(:includes).and_call_original
        get :get_students_grades, {format: :json}
        expect(assigns(:student)).to eq(student)
      end
    end

    describe "GET #index" do
      let!(:students) { FactoryGirl.create_list(:student, 3) }

      before(:each) { get :index, {format: :json} }

      it "assigns all divisions as @divisions" do
        expect(assigns(:students)).to match_array(students)
      end

      it "should render proper JSON response" do
        expect(response.body).to be_json_eql(students.to_json(:include => :division) )
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Student" do
          expect {
            post :create, {:student => valid_attributes}
          }.to change(Student, :count).by(1)
        end

        it "assigns a newly created student as @student" do
          post :create, {:student => valid_attributes}
          expect(assigns(:student)).to be_a(Student)
          expect(assigns(:student)).to be_persisted
        end

        it "returns status 201 created" do
          post :create, {:student => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved student as @student" do
          post :create, {:student => invalid_attributes}
          expect(assigns(:student)).to be_a_new(Student)
        end

        it "returns status unprocessable entity" do
          post :create, {:student => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
            name: Faker::Name.name,
            email: Faker::Internet.email,
            role: student_template.role,
            password: student_template.password,
            password_confirmation: student_template.password_confirmation,
            division_id: student_template.division.id
          }
        }

        it "updates the requested student" do
          student = FactoryGirl.create(:student)
          put :update, {:id => student.to_param, :student => new_attributes}
          student.reload
          expect(student.name).to eq(new_attributes[:name])
        end

        it "assigns the requested student as @student" do
          student = FactoryGirl.create(:student)
          put :update, {:id => student.to_param, :student => valid_attributes}
          expect(assigns(:student)).to eq(student)
        end

        it "returns status 200 OK" do
          student = FactoryGirl.create(:student)
          put :update, {:id => student.to_param, :student => valid_attributes}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        it "assigns the student as @student" do
          student = FactoryGirl.create(:student)
          put :update, {:id => student.to_param, :student => invalid_attributes}
          expect(assigns(:student)).to eq(student)
        end

        it "returns status 422 unprocessable entity" do
          student = FactoryGirl.create(:student)
          put :update, {:id => student.to_param, :student => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested student" do
        student = Student.create! valid_attributes
        expect {
          delete :destroy, {:id => student.to_param}
        }.to change(Student, :count).by(-1)
      end

      it "returns status 204 no content" do
        student = Student.create! valid_attributes
        delete :destroy, {:id => student.to_param}
        expect(response).to have_http_status(:no_content)
      end
    end

  end

  context "is unauthorized" do
    is_unauthorized

    describe "GET #index" do
      it "raise CanCan::AccessDenied error" do
        expect{ get :index, {format: :json}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "POST #create" do
      it "raise CanCan::AccessDenied error" do
        expect{ post :create, {:student => invalid_attributes}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "PUT #update" do
      it "raise CanCan::AccessDenied error" do
        student = FactoryGirl.create(:student)
        expect {
          put :update, {:id => student.to_param, :student => invalid_attributes }
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "DELETE #destroy" do
      it "raise CanCan::AccessDenied error" do
        student = FactoryGirl.create(:student)
        expect {
          delete :destroy, {:id => student.to_param }
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
