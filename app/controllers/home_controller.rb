class HomeController < ApplicationController
  def index #retrieves 10 most recent quotes for home page
    @quotes = Quote.includes(:categories).where(is_public: true).order(created_at: :desc).take(10) #i got help from copilot to figure out how to order records
  end

  def uquotes #retrieves quotes owned by the currently logged in user
    @quotes = Quote.includes(:categories).where(user_id: session[:user_id])
  end
end
