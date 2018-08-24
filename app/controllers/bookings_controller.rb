class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @b_start = params[:booking][:duration].split('to').first
    @b_end = params[:booking][:duration].split('to').last
    @booking_d = Date.parse(@b_end) - Date.parse(@b_start)
    @booking_duration = @booking_d.to_i
    @booking_price = @machine.price_per_hour * @booking_duration
    @booking = Booking.create(booking_params)
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:duration, :user_id, :price, :machine_id)
  end

end
