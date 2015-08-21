require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  let(:teacher_template) { FactoryGirl.build(:teacher) }

  let(:valid_attributes) {
    {
      name: teacher_template.name,
      email: teacher_template.email,
      role: teacher_template.role,
      password: teacher_template.password,
      password_confirmation: teacher_template.password_confirmation,
    }
  }

  let(:invalid_attributes) {
    {
      name: teacher_template.name,
      email: 'asdf',
      role: teacher_template.role,
      password: teacher_template.password,
      password_confirmation: teacher_template.password_confirmation+'a',
    }
  }

  context "is authorized" do
    is_authorized

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Teacher" do
          expect {
            post :create, {:teacher => valid_attributes}
          }.to change(Teacher, :count).by(1)
        end

        it "assigns a newly created teacher as @teacher" do
          post :create, {:teacher => valid_attributes}
          expect(assigns(:teacher)).to be_a(Teacher)
          expect(assigns(:teacher)).to be_persisted
        end

        it "returns status 201 created" do
          post :create, {:teacher => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved teacher as @teacher" do
          post :create, {:teacher => invalid_attributes}
          expect(assigns(:teacher)).to be_a_new(Teacher)
        end

        it "returns status unprocessable entity" do
          post :create, {:teacher => invalid_attributes}
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
            role: teacher_template.role,
            password: teacher_template.password,
            password_confirmation: teacher_template.password_confirmation
          }
        }

        it "updates the requested teacher" do
          teacher = FactoryGirl.create(:teacher)
          put :update, {:id => teacher.to_param, :teacher => new_attributes}
          teacher.reload
          expect(teacher.name).to eq(new_attributes[:name])
        end

        it "assigns the requested teacher as @teacher" do
          teacher = FactoryGirl.create(:teacher)
          put :update, {:id => teacher.to_param, :teacher => valid_attributes}
          expect(assigns(:teacher)).to eq(teacher)
        end

        it "returns status 200 OK" do
          teacher = FactoryGirl.create(:teacher)
          put :update, {:id => teacher.to_param, :teacher => valid_attributes}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        it "assigns the teacher as @teacher" do
          teacher = FactoryGirl.create(:teacher)
          put :update, {:id => teacher.to_param, :teacher => invalid_attributes}
          expect(assigns(:teacher)).to eq(teacher)
        end

        it "returns status 422 unprocessable entity" do
          teacher = FactoryGirl.create(:teacher)
          put :update, {:id => teacher.to_param, :teacher => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested teacher" do
        teacher = Teacher.create! valid_attributes
        expect {
          delete :destroy, {:id => teacher.to_param}
        }.to change(Teacher, :count).by(-1)
      end

      it "returns status 204 no content" do
        teacher = Teacher.create! valid_attributes
        delete :destroy, {:id => teacher.to_param}
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
        expect{ post :create, {:teacher => invalid_attributes}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "PUT #update" do
      it "raise CanCan::AccessDenied error" do
        teacher = FactoryGirl.create(:teacher)
        expect {
          put :update, {:id => teacher.to_param, :teacher => invalid_attributes }
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "DELETE #destroy" do
      it "raise CanCan::AccessDenied error" do
        teacher = FactoryGirl.create(:teacher)
        expect {
          delete :destroy, {:id => teacher.to_param }
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
