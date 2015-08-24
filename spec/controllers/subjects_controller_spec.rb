require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  let!(:valid_attributes) {
    { name: 'Maths', teacher_id: FactoryGirl.create(:teacher).id }
  }

  let(:invalid_attributes) {
    { name: '', teacher_id: nil }
  }

  context "is authorized" do
    is_authorized

    describe "GET #index" do
      it "assigns all subjects as @subjects" do
        subject = Subject.create! valid_attributes
        get :index, {format: :json}
        expect(assigns(:subjects)).to match_array(subject)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Subject" do
          expect {
            post :create, {:subject => valid_attributes}
          }.to change(Subject, :count).by(1)
        end

        it "assigns a newly created subject as @subject" do
          post :create, {:subject => valid_attributes}
          expect(assigns(:subject)).to be_a(Subject)
          expect(assigns(:subject)).to be_persisted
        end

        it "returns status 201 created" do
          post :create, {:subject => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved subject as @subject" do
          post :create, {:subject => invalid_attributes}
          expect(assigns(:subject)).to be_a_new(Subject)
        end

        it "returns status unprocessable entity" do
          post :create, {:subject => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {name: 'Physics', teacher_id: FactoryGirl.create(:teacher, email: Faker::Internet.email).id }
        }

        it "updates the requested subject" do
          subject = Subject.create! valid_attributes
          put :update, {:id => subject.to_param, :subject => new_attributes}
          subject.reload
          expect(subject.name).to eq('Physics')
        end

        it "assigns the requested subject as @subject" do
          subject = Subject.create! valid_attributes
          put :update, {:id => subject.to_param, :subject => valid_attributes}
          expect(assigns(:subject)).to eq(subject)
        end

        it "returns status 200 OK" do
          subject = Subject.create! valid_attributes
          put :update, {:id => subject.to_param, :subject => valid_attributes}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        it "assigns the subject as @subject" do
          subject = Subject.create! valid_attributes
          put :update, {:id => subject.to_param, :subject => invalid_attributes}
          expect(assigns(:subject)).to eq(subject)
        end

        it "returns status 422 unprocessable entity" do
          subject = Subject.create! valid_attributes
          put :update, {:id => subject.to_param, :subject => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested subject" do
        subject = Subject.create! valid_attributes
        expect {
          delete :destroy, {:id => subject.to_param}
        }.to change(Subject, :count).by(-1)
      end

      it "returns status 204 no content" do
        subject = Subject.create! valid_attributes
        delete :destroy, {:id => subject.to_param}
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
        expect{ post :create, {:subject => invalid_attributes}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "PUT #update" do
      it "raise CanCan::AccessDenied error" do
        subject = Subject.create! valid_attributes
        expect {
          put :update, {:id => Subject.create!(valid_attributes).to_param, :subject => invalid_attributes}
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "DELETE #destroy" do
      it "raise CanCan::AccessDenied error" do
        subject = Subject.create! valid_attributes
        expect {
          delete :destroy, {:id => subject.to_param}
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
