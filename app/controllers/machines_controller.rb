class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # raise
    # if params[:search].present?
    #   @machines = Machine.algolia_search(params[:search])
    #   # Machine.search_by(params[:search]).with_pg_search_highlight
    # else
      @machines = Machine.all
    # end

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
    @machine_params = machine_params
    # before_save
    if @machine.save
      redirect_to machine_path(@machine)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def list
    @current_user = current_user
    @current_user_id = current_user.id
    @machine = Machine.where(user_id: @current_user_id)
  end

  private

  def machine_params
    params.require(:machine).permit(:make, :category, :photo, :force_moteur, :roues_motrices, :price_per_hour, :location, :year, :description, :min_hours)
  end

end
