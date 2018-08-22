class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @machines = Machine.where.not(latitude: nil, longitude: nil)

    @markers = @machines.map do |machine|
      {
        lat: machine.latitude,
        lng: machine.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
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
      raise
      redirect_to my_machines_path
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
    # @myMachines = Machine.where({|machine| machine.user_id == current_user})
  end

  private

  def machine_params
    params.require(:machine).permit(:make, :category, :photo, :force_moteur, :roues_motrices, :price_per_hour, :location, :year)
  end

end
