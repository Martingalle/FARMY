class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # raise
    if params[:search].present?
      @machines = Machine.search_by(params[:search]).with_pg_search_highlight
    else
      @machines = Machine.all
    end

    # @machines = Machine.where(latitude: nil, longitude: nil)

    @markers = @machines.map do |machine|
      {
        lat: machine.latitude,
        lng: machine.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @machine = Machine.find(params[:id])
    @booking = Booking.new
  end

  def new
    @machine = Machine.new
  end

  def create
    @user_id = current_user.id
    @machine = Machine.new(machine_params)
    @machine.user_id = @user_id
    # before_save
    if @machine.save
      redirect_to machine_path(@machine)
    else
      render 'new'
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def update
    @machine = Machine.find(params[:id])
    @machine.update(machine_params)
    redirect_to machine_path(@machine)
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to my_machines_path
  end

  def list
    @users = User.all
    @current_user = current_user
    @machines = Machine.all
    @machine = Machine.where(user_id: @current_user_id)
  end

  private

  def machine_params
    params.require(:machine).permit(:make, :category, :photo, :force_moteur, :roues_motrices, :price_per_hour, :location, :year, :description)
  end

end
