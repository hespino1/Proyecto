class InvitacionesController < ApplicationController
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
    params[:invitacione][:user_origen] = get_id


    respond_to do |format|
      if @invitacione.save
        format.html { redirect_to @invitacione, :notice => 'invitacione was successfully created.' }

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
    @invitacione = Invitacione.find(params[:id])
    @invitacione.destroy

    respond_to do |format|
      format.html { redirect_to invitaciones_url }

    end
  end
end
