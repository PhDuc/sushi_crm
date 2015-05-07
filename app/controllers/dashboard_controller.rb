class DashboardController < ApplicationController
  before_action :set_feedback
  before_action :set_token

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


    capability = Twilio::Util::Capability.new 'AC59ddac51f6133902872d632f5e5cca9a', '111ad6f3158e682e5eaabb032a3df539'
    capability.allow_client_outgoing 'APef92c29b4373cfbf4d179c3cf406cc2c'
    @token = capability.generate()
    render :json => {token: @token}
  end

  def submit_feedback

  end

  private
  def set_feedback
    @feedback = Feedback.new
  end

  def set_token
  end
end
