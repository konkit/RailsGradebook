require 'rails_helper'

RSpec.describe DivisionsController, type: :controller do
  # Setting json response, no templates rendered
  render_views
  let(:json) { JSON.parse(response.body) }

  let(:valid_attributes) {
    { name: 'I B' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  context "is authorized" do
    is_authorized

    describe "GET #index" do
      it "assigns all divisions as @divisions" do
        expected = Division.create!(valid_attributes)
        get :index, {format: :json}
        expect(assigns(:divisions)).to match_array(expected)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Division" do
          expect {
            post :create, {:division => valid_attributes}
          }.to change(Division, :count).by(1)
        end

        it "assigns a newly created division as @division" do
          post :create, {:division => valid_attributes}
          expect(assigns(:division)).to be_a(Division)
          expect(assigns(:division)).to be_persisted
        end

        it "returns status 201 created" do
          post :create, {:division => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved division as @division" do
          post :create, {:division => invalid_attributes}
          expect(assigns(:division)).to be_a_new(Division)
        end

        it "returns status unprocessable entity" do
          post :create, {:division => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { name: 'II B' }
        }

        it "updates the requested division" do
          division = Division.create! valid_attributes
          put :update, {:id => division.to_param, :division => new_attributes}
          division.reload
          expect(division.name).to eq('II B')
        end

        it "assigns the requested division as @division" do
          division = Division.create! valid_attributes
          put :update, {:id => division.to_param, :division => valid_attributes}
          expect(assigns(:division)).to eq(division)
        end

        it "returns status 200 OK" do
          division = Division.create! valid_attributes
          put :update, {:id => division.to_param, :division => valid_attributes}
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid params" do
        it "assigns the division as @division" do
          division = Division.create! valid_attributes
          put :update, {:id => division.to_param, :division => invalid_attributes}
          expect(assigns(:division)).to eq(division)
        end

        it "returns status 422 unprocessable entity" do
          division = Division.create! valid_attributes
          put :update, {:id => division.to_param, :division => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested division" do
        division = Division.create! valid_attributes
        expect {
          delete :destroy, {:id => division.to_param}
        }.to change(Division, :count).by(-1)
      end

      it "returns status 204 no content" do
        division = Division.create! valid_attributes
        delete :destroy, {:id => division.to_param}
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
        expect{ post :create, {:division => invalid_attributes}  }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "PUT #update" do
      it "raise CanCan::AccessDenied error" do
        division = Division.create! valid_attributes
        expect {
          put :update, {:id => Division.create!(valid_attributes).to_param, :division => invalid_attributes}
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "DELETE #destroy" do
      it "raise CanCan::AccessDenied error" do
        division = Division.create! valid_attributes
        expect {
          delete :destroy, {:id => division.to_param}
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
