class DashboardController < ApplicationController
  before_action :set_feedback
  def index

  end

  def account

  end

  def agent
    Rails.logger.info "HITTING AGENT, SID: #{Rails.application.secrets.twilio_account_sid}, AUTH_TOKEN: #{Rails.application.secrets.twilio_auth_token}, APP_SID: #{Rails.application.secrets.twilio_twiml_app_sid}"

    # Hard code a default customer to display. In production, this
    # would come from a database.
    @customer = OpenStruct.new(
      'id' => '123',
      'first_name' => 'Jane',
      'last_name' => 'Doe',
      'city' => 'Seattle',
      'state' => 'WA'
    )


    capability = Twilio::Util::Capability.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    capability.allow_client_outgoing Rails.application.secrets.twilio_twiml_app_sid
    @token = capability.generate()
    render :json => {token: '123456'}
  end

  def submit_feedback

  end

  private
  def set_feedback
    @feedback = Feedback.new
  end
end
