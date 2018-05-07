class ReviewsController < ApplicationController
  before_action :move_to_users_session, only: [:new, :destroy, :edit]

  def index
    @reviews = Review.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    @place = Place.find(params[:place_id])
    respond_to do |format|
      if Review.create(create_params)
        format.html { redirect_to places_path, notice: "#{@place.name}のレビューを投稿しました" }
      else
        format.html { redirect_to new_place_review_path, alert: "登録できませんでした。レビューがきちんと書かれているか確認してください" }
      end
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy if review.user_id == current_user.id
  end

  def edit
    @review = Review.find(params[:id])
    @place = Place.find(@review.place_id)
  end

  def update
    @place = Place.find(params[:place_id])
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      respond_to do |format|
        if review.update(create_params)
          format.html { redirect_to user_path, notice: "#{@place.name} のレビューを更新しました" }
        else
          format.html { redirect_to edit_place_review_path, alert: "更新できませんでした。レビューがきちんと書かれているか確認してください" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_place_review_path, alert: "更新できませんでした。" }
      end
    end
  end


    private
      def create_params
        params.require(:review).permit(:review, :rank).merge(place_id: params[:place_id], user_id: current_user.id)
      end

      def move_to_users_session
        redirect_to new_user_session_path unless user_signed_in?
      end
end
