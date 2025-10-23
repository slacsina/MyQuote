class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:index, :show] #ensures user is logged in to add or edit quotes
  before_action :check_owner, only: %i[ edit update destroy ] #ensures users can only edit, update or destroy records they own

  # GET /quotes or /quotes.json
  def index
    @quotes = current_user.quotes
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    8.times { @quote.quote_categories.build }  # Give the form eight (8) quote category fields which will be enough for the purposes of our prototype
    @quote.build_author
  end

  # GET /quotes/1/edit
  def edit
    @quote.build_author if @quote.author.nil? #Copilot helped me figure out i needed to add this to allow users to add Author details if there isn't already one associated
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        8.times { @quote.quote_categories.build } #
        @quote.build_author #Copilot helped me figure out I had to re-add the two builds to ensure the form reloads properly when failing to save a new record
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: "Quote was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy!

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:textbody, :pubyear, :comment, :is_public, :user_id, :author_id, quote_categories_attributes: [:id, :category_id],
      author_attributes: [:id, :auth_fname, :auth_surname, :birthyear, :deathyear, :biography])
    end

    # Only allow users to update or delete their own quotes
    def check_owner
      unless @quote.user_id == current_user.id
        flash[:error] = "You are not authorised to do that!"
        redirect_to root_path
      end
    end
end
