class DashboardController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def submit_feedback

  end
end
