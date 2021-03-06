class InvitacionesController < ApplicationController
  before_filter :logged_user

  # GET /invitaciones
  # GET /invitaciones.json
  def index
    @invitaciones = Invitacione.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /invitaciones/1
  # GET /invitaciones/1.json
  def show
    @invitacione = Invitacione.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end

  # GET /invitaciones/new
  # GET /invitaciones/new.json
  def new
    @invitacione = Invitacione.new
    users = User.all()
    invitados = Invitacione.find_all_by_reserva_id(params[:reserva])
    @invitados = []
    invitados.each do |b|
       @invitados << User.find(b.user_id)
    end

    @users = []
    users.each do |user|
      if !user.id.eql? get_id.to_i
          @users << user
      end
    end
    @users = @users - @invitados

    respond_to do |format|
      format.html # new.html.erb

    end
  end

  # GET /invitaciones/1/edit
  def edit
    @invitacione = Invitacione.find(params[:id])
  end

  # POST /invitaciones
  # POST /invitaciones.json
  def create
    #params[:invitacione][:user_origen] = get_id
    puts "-"*60
    puts params[:user_id]
    puts params[:reserva_id]

    respond_to do |format|
      if Invitacione.create(:user_id => params[:user_id], :reserva_id => params[:reserva_id], :user_origen => get_id)
        format.html { redirect_to new_invitacione_path( :reserva => params[:reserva_id]), :notice => 'El usuario ha sido invitado' }

      else
        format.html { render :action => "new" }

      end
    end
  end

  # PUT /invitaciones/1
  # PUT /invitaciones/1.json
  def update
    @invitacione = Invitacione.find(params[:id])

    respond_to do |format|
      if @invitacione.update_attributes(params[:invitacione])
        format.html { redirect_to @invitacione, :notice => 'Invitacione was successfully updated.' }

      else
        format.html { render :action => "edit" }

      end
    end
  end

  # DELETE /invitaciones/1
  # DELETE /invitaciones/1.json
  def destroy
    if request.path_parameters['controller'].eql? "/users"

    end
      @invitacione = Invitacione.find_by_user_id(params[:id])
    @invitacione.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }

    end
  end
  private

  def logged_user
    if signed_in?.eql? false
      redirect_to(root_path, :alert => "El usuario tiene que estar logueado")

    end
  end
end
