class ReviewsController < ApplicationController
  before_action :set_review, except: %i[ show index ]
  before_action :set_product
  before_action :authenticate_user!
  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id

    if @review.save
        flash[:notice] = "Review was successfully created."
        redirect_to @product
    else
        render :new
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
      if @review.update(review_params)
        flash[:notice] = "Review was successfully updated."
        redirect_to @product
      else
        render :edit
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    flash[:notice] = "Review was successfully destroyed." 
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find_by(params[:id])
    end
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :product_id)
    end
end
