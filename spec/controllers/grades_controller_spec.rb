require 'rails_helper'

RSpec.describe GradesController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  let(:student) { FactoryGirl.create(:student) }
  let(:subject) { FactoryGirl.create(:subject) }

  let(:valid_attributes) {
    { gradevalue: 5, subject_id: subject.id, student_id: student.id }
  }

  let(:invalid_attributes) {
    { gradevalue: 8, subject_id: subject.id, student_id: student.id }
  }

  context "is authorized" do
    is_authorized

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Grade" do
          expect {
            post :create, {:grade => valid_attributes}
          }.to change(Grade, :count).by(1)
        end

        it "assigns a newly created grade as @grade" do
          post :create, {:grade => valid_attributes}
          expect(assigns(:grade)).to be_a(Grade)
          expect(assigns(:grade)).to be_persisted
        end

        it "returns status 201 created" do
          post :create, {:grade => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved grade as @grade" do
          post :create, {:grade => invalid_attributes}
          expect(assigns(:grade)).to be_a_new(Grade)
        end

        it "returns status unprocessable entity" do
          post :create, {:grade => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { gradevalue: 2, subject_id: subject.id, student_id: student.id }
        }

        it "updates the requested grade" do
          grade = FactoryGirl.create(:grade)
          put :update, {:id => grade.to_param, :grade => new_attributes}
          grade.reload
          expect(grade.gradevalue).to eq(2)
        end

        it "assigns the requested grade as @grade" do
          grade = Grade.create! valid_attributes
          put :update, {:id => grade.to_param, :grade => valid_attributes}
          expect(assigns(:grade)).to eq(grade)
        end

        it "returns status 200 OK" do
          grade = Grade.create! valid_attributes
          put :update, {:id => grade.to_param, :grade => valid_attributes}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        it "assigns the grade as @grade" do
          grade = Grade.create! valid_attributes
          put :update, {:id => grade.to_param, :grade => invalid_attributes}
          expect(assigns(:grade)).to eq(grade)
        end

        it "returns status 422 unprocessable entity" do
          grade = Grade.create! valid_attributes
          put :update, {:id => grade.to_param, :grade => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested grade" do
        grade = Grade.create! valid_attributes
        expect {
          delete :destroy, {:id => grade.to_param}
        }.to change(Grade, :count).by(-1)
      end

      it "returns status 204 no content" do
        grade = Grade.create! valid_attributes
        delete :destroy, {:id => grade.to_param}
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
        expect{ post :create, {:grade => invalid_attributes}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "PUT #update" do
      it "raise CanCan::AccessDenied error" do
        grade = Grade.create! valid_attributes
        expect {
          put :update, {:id => Grade.create!(valid_attributes).to_param, :grade => invalid_attributes}
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "DELETE #destroy" do
      it "raise CanCan::AccessDenied error" do
        grade = Grade.create! valid_attributes
        expect {
          delete :destroy, {:id => grade.to_param}
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
