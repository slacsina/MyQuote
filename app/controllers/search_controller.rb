class SearchController < ApplicationController
  def index #queries database based on user input
    category_query = params[:category_query]
		  if category_query.present?
		    @categorymatch = Quote.joins(:quote_categories, :categories).where(is_public: true).where("categories.cat_name LIKE ?", "%#{category_query}%").distinct
      end
  end
end
