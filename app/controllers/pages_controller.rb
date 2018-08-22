class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @machines = Machine.all
  end
end
