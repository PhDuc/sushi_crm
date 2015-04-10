class DashboardController < ApplicationController
  before_action :set_feedback
  def index

  end

  def account

  end

  def submit_feedback

  end

  private
  def set_feedback
    @feedback = Feedback.new
  end
end
