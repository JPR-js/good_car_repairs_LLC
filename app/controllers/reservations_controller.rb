class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # helper_method :current_user

 

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    #store session information about user's id and ip.
    write_log("in new")
    session[:current_user_id] = params[:user_id]
    session[:user_ip] = request.remote_ip
    hold = Reservation.find_by(user_id: params[:user_id])
    if hold
      write_log("Correct, the record does exist")
      @reservation = Reservation.find_by(user_id: params[:user_id])
      redirect_to @reservation

    else
      write_log("correct, the record doesnt exist")
      @reservation = Reservation.new
    end
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    write_log("in create -\n")
    @reservation = Reservation.new(reservation_params)
    @user = User.find(session[:current_user_id])
    respond_to do |format|
      if @reservation.save
        UserMailer.reservation_confirmation(@user, @reservation).deliver
        UserMailer.car_repair_appointment(@user, @reservation).deliver

        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:f_name, :l_name, :phone_num, :year, :make, :model, :repair, :date, :user_id, :ip)
    end

    def write_log(str_to_log)
      aFile = File.open("#{Rails.root}/log/my_log.txt", "a")
      aFile.syswrite(str_to_log)
      aFile.syswrite("\n")
      aFile.close()
    end


end
