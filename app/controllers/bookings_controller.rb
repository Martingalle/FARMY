class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @machine.id = @machine_id
    @booking = Booking.new(booking_params)
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:duration, :user_id, :price, :machine_id)
  end

end
