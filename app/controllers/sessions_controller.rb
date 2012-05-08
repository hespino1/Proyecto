class SessionsController < ApplicationController
  def index
    if signed_in?
      redirect_to user_path(get_id)
    else
      @user = User.new
    end
  end

  def new
     correo =  params[:correo]
     pass = params[:password]
     @user = User.find_by_correo(correo)
       if @user.nil?
         redirect_to('/sessions/index', :alert => "El usuario no existe")

       elsif @user.password.eql? pass
         set_nombre(@user.nombre)
         set_id(@user.id)
         redirect_to root_path, :notice=> "Bienvenido"
       else
         redirect_to('/sessions/index', :alert =>"Email o contrasena erradas" )
       end
  end

  def destroy
      sign_out
      redirect_to root_path
  end


end
