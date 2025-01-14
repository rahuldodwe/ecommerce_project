class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = @order.feedbacks.build(feedback_params.merge(user: current_user))

    if @feedback.save
      redirect_to product_path(@feedback.product), notice: 'Thank you for your feedback!'
    else
      flash.now[:alert] = 'Failed to submit feedback. Please try again.'
      render :new
    end
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end

  def feedback_params
    params.require(:feedback).permit(:product_id, :rating, :comment)
  end
end
