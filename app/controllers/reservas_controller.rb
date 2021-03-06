class ReservasController < ApplicationController
  before_filter :logged_user

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /reservas/new
  # GET /reservas/new.json
  def new
    @reserva = Reserva.new

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
  end

  # POST /reservas
  # POST /reservas.json
  def create
    params[:reserva][:id_user] = get_id
    puts params
    @reserva = Reserva.new(params[:reserva])

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to user_path(get_id), :notice => 'Su reserva fue creada exitosamente.' }
      else
        format.html { render :action => "new" }

      end
    end
  end

  # PUT /reservas/1
  # PUT /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to user_path(get_id), :notice => 'Su reserva fue actualizada exitosamente.' }

      else
        format.html { render :action => "editar" }

      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy
    @invitacion = Invitacione.find_all_by_reserva_id(params[:id])
    @invitacion.each do |invitacion|
      invitacion.destroy
    end
    respond_to do |format|
      format.html { redirect_to user_path(get_id) , :notice=> 'Su reserva ha sido eliminada'}

    end
  end

  private

  def logged_user
    if !signed_in?
      redirect_to '/sessions/index', :alert => "Tiene que estar logueado"
    end
  end
end



