class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method  :signed_in?, :set_nombre, :get_nombre, :sign_out, :set_id, :get_id, :sign_out

  def signed_in?
    !get_nombre.nil?

  end

  def set_nombre(nombre)
    cookies[:nombre] = nombre
  end

  def get_nombre
    cookies[:nombre]
  end
  def set_id(id)
    cookies[:id] = id
  end

  def get_id
    cookies[:id]
  end

  def sign_out
    cookies.delete :nombre
  end



end
