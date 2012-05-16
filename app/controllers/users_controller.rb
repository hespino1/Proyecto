class UsersController < ApplicationController
 before_filter :logged_user, :only => [:index, :show, :edit, :update, :destroy]
 #before_filter :correct_user


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @reservas = Reserva.find_all_by_id_user(params[:id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/sessions/index', :notice=> 'El usuario fue creado exitosamente' }
        else
        format.html { render :action=> "new" }

      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice=> 'User was successfully updated.' }

      else
        format.html { render :action=> "edit" }

      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }

    end
  end

  private

  def logged_user
    if signed_in?.eql? false
      redirect_to(root_path, :alert => "tiene que estar logueado")

    end
  end
end
