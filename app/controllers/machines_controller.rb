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
    @user = current_user
  end

  def create
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

end
