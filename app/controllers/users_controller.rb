class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      
        if @user.save
          flash[:success] = 'Successfully created'
          redirect_to new_user_path
        else
          flash[:error] = 'oh oh! something went wrong'
          render :new
        end
      end
    end
