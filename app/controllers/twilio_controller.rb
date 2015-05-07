require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end

  # def make_call
  #   account_sid = "AC0db54d68813bbbd99edfb93a93d2eb79"
  #   auth_token = "dc3540558de602a76c35869b0f575f16"
  #   @client ||= Twilio::REST::Client.new account_sid, auth_token
  #   @call = @client.account.calls.create(
  #     :url => "http://demo.twilio.com/docs/voice.xml",
  #     :to => "+14108675309",
  #     :from => "+15005550006")
  #   puts call.start_time
  # end

  def connect_customer
    Rails.logger.info "[INFO] ConnectCustomer: #{params.inspect} "
    response = Twilio::TwiML::Response.new do |r|
      # r.Say 'Hello. Connecting you the customer now.', :voice => 'alice'
      r.Dial :callerId => '14086101410' do |d|
        d.Number('+14082217183')
      end

    end
    render_twiml response
  end
end
