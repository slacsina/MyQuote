class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:categories).take(5)
  end

  def uquotes
    @quotes = Quote.includes(:categories).where(user_id: session[:user_id])
  end
end
