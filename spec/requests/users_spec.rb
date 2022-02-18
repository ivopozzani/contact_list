# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'assigns @users' do
      user = create(:user)
      get users_path
      expect(assigns(:users).first).to eq(user)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = create(:user)
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'assigns @user' do
      user = create(:user)
      get user_path(user)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users' do
    context 'when valid' do
      subject { post users_path, params: { user: { name: 'lorem', age: 32, biography: 'lorem lorem lorem' } } }

      it 'returns http found' do
        expect(subject).to eq(302)
      end

      it 'redirects_to /users/:id' do
        expect(subject).to redirect_to("/users/#{assigns(:user).id}")
      end

      it 'add user to db' do
        subject
        expect(User.all.count).to eq(1)
      end
    end

    context 'when not valid' do
      it 'does not add user to db' do
        post users_path, params: { user: { name: '' } }
        expect(assigns(:user).errors.full_messages_for(:name)).to eq(["Name can't be blank"])
      end
    end
  end

  describe 'GET /users/:id/edit' do
    it 'returns http success' do
      user = create(:user)
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /users/:id' do
    it 'responds to html by default' do
      user = create(:user)
      patch user_path(user), params: { user: { name: 'lorem' } }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it "changes user's attributes" do
      user = create(:user)
      patch user_path(user), params: { user: { name: 'lorem' } }
      user.reload
      expect(user.name).to eq('lorem')
    end
  end

  describe 'DELETE /users/:id' do    
    it 'returns http status "see_other"' do
      user = create(:user)
      delete user_path(user)
      expect(response).to have_http_status(:see_other)
    end

    it 'deletes user' do
      user = create(:user)
      expect { delete user_path(user) }.to change { User.count }.by(-1)
    end
  end
end
