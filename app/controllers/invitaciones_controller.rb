class InvitacionesController < ApplicationController
  # GET /invitaciones
  # GET /invitaciones.json
  def index
    @invitaciones = Invitacione.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitaciones }
    end
  end

  # GET /invitaciones/1
  # GET /invitaciones/1.json
  def show
    @invitacione = Invitacione.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitacione }
    end
  end

  # GET /invitaciones/new
  # GET /invitaciones/new.json
  def new
    @invitacione = Invitacione.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitacione }
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
    @invitacione = Invitacione.new(params[:invitacione])

    respond_to do |format|
      if @invitacione.save
        format.html { redirect_to @invitacione, notice: 'Invitacione was successfully created.' }
        format.json { render json: @invitacione, status: :created, location: @invitacione }
      else
        format.html { render action: "new" }
        format.json { render json: @invitacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invitaciones/1
  # PUT /invitaciones/1.json
  def update
    @invitacione = Invitacione.find(params[:id])

    respond_to do |format|
      if @invitacione.update_attributes(params[:invitacione])
        format.html { redirect_to @invitacione, notice: 'Invitacione was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitacione.errors, status: :unprocessable_entity }
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
      format.json { head :no_content }
    end
  end
end
