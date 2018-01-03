class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
    @address = params[:address]
    @title = "Monero Mining Statistic for #{@address}"
  end

  def index
    @title = "Monero Mining Income Statistic Tracker"
  end

  def start
    address = params[:address]
    unless Stat.addr(address).any?
      Stat.import!(address)
      @start = 1
    end
    redirect_to address_path(address, start: @start)
  end

end
