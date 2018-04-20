require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #user controller does new, create, index, show
  describe 'POST #create' do
    context 'with invalid params' do
      it 'validates the presence of username and password' do
        post :create, params: { user: { username: "bob", password: "" } }

        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it 'validates that the password is at least 6 chars long' do
        post :create, params: { user: { username: 'bob', password: "bob"} }

        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

    end

    context 'with valid params' do
      it 'creates user and redirects to the sign-in page' do
        post :create, params: { user: { username: "Bob", password: "password" } }
        expect(response).to redirect_to(new_session_url)
      end
    end

  end

end
