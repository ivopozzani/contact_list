# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  @user = User.find(params[:id])
  @phones = Phone.all
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
