class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @booking = Booking.new(booking_params)
    @booking_price = @machine.price_per_hour * 4
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:duration, :user_id, :price, :machine_id)
  end

end
