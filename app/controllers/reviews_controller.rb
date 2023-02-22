class ReviewsController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @reviews= Review.all
    @reviews = @reviews.page(params[:page]).per(5)
    @tags = Tag.all
    @reviews = @reviews.where("about LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    #もしタグ検索したら、review_idsにタグを持ったidをまとめてそのidで検索
    if params[:tag_ids].present?
      review_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).reviews.each do |p| 
            review_ids << p.id
          end
        end
      end
      review_ids = review_ids.uniq
      #キーワードとタグのAND検索
      if review_ids.present?
        @reviews = @reviews.where(id: review_ids)
      else
        @reviews = @reviews.where(id: 0)
      end
    end
  end

    def new
        @review = Review.new
        if params[:tag]
          Tag.create(name: params[:tag])
        end  
    end
    
      def create
        review = Review.new(review_params)
        review.user_id = current_user.id
        if review.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def edit
        @review = Review.find(params[:id])
      end

      def update
        review = Review.find(params[:id])
        if review.update(review_params)
          redirect_to :action => "show", :id => review.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to action: :index
      end

      def show
        @review = Review.find(params[:id])
      end

      private
      def review_params
        params.require(:review).permit(:user_id, :about, :image, tag_ids: [])
      end

end
