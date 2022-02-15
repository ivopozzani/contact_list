# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'assigns @users' do
      user = create(:user)
      get '/users'
      expect(assigns(:users).first).to eq(user)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = create(:user)
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'assigns @user' do
      user = create(:user)
      get "/users/#{user.id}"
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET /new' do
    pending 'not implemented yet'
    it 'returns http success' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    pending 'not implemented yet'
    it 'returns http success' do
      get '/users/create'
      expect(response).to have_http_status(:success)
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
