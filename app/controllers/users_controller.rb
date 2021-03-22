# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def new
    @user = User.new
  end

  def create
    # @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Successfully created'
      redirect_to new_user_path
    else
      flash[:error] = 'oh oh! something went wrong'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
