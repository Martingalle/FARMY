class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :machines

  def home
  end
end
