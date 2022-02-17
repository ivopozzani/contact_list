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
      get users_new_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users' do
    subject { post users_path, params: {user: { name:'lorem', age:32, biography:'lorem lorem lorem' }} }
    
    it 'returns http found' do
      expect(subject).to eq(302)
    end

    it 'redirects_to /users/:id' do
      expect(subject).to redirect_to("/users/#{assigns(:user).id}")
    end
  end

  describe 'GET /edit' do
    pending 'not implemented yet'
    it 'returns http success' do
      get '/users/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    pending 'not implemented yet'
    it 'returns http success' do
      get '/users/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    pending 'not implemented yet'
    it 'returns http success' do
      get '/users/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
