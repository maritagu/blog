class UsersController < ApplicationController
  def show
    @user = User.where
    @articles =Article.where(user_id:current_user.id).order('id DESC')
  end
end
