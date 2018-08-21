class MachinesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @machines = Machine.all
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
