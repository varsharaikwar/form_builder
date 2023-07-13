class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(hobbies: params[:user][:hobbies])
    
        if @user.save
          redirect_to @user
        else
          render :new, status: :unprocessable_entity
        end
      end
end
