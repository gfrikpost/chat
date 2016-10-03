class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    form = UserForm.new(User.new, params[:user])

    if form.submit
      sing_in(form.user.id)
      redirect_to messages_path
    else
      flash[:error] = form.error
      redirect_to new_user_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    form = UserForm.new(current_user, params[:user])

    if form.submit
      flash[:notice] = 'User settings success updated'
    else
      flash[:error] = form.error
    end

    redirect_to edit_user_path(current_user)
  end
end
