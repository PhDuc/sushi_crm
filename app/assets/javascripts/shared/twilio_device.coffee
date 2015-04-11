class TwilioDevice
  constructor: ->
    console.log('123')
    @initTwilioDeviceBindings()
    console.log('456')
    @initFormBindings()

  initTwilioDeviceBindings: ->
    # url = "https://xkzblgxuix.localtunnel.me/dashboard/agent"
    # $.getJSON(url, {}, (data)->  $('#twilioToken').val(data.token))
    twilio_token = $('#twilioToken').val()
    twilio_device = Twilio.Device
    console.log("Setup Twilio token: " + twilio_token)
    # Create the Client with a Capability Token
    twilio_device.setup(twilio_token, {debug: true})

    #/* Let us know when the client is ready. */
    twilio_device.ready ->
      $("#log").text("Ready")

    #/* Report any errors on the screen */
    twilio_device.error (error) ->
      $("#log").text("Error: " + error.message)

    #/* Log a message when a call connects. */
    twilio_device.connect (conn) ->
      $("#log").text("Successfully established call")

    #/* Log a message when a call disconnects. */
    twilio_device.disconnect (conn) ->
      $("#log").text("Call ended")

  initFormBindings: ->
    $('#caller').bind "click", (event) ->
      console.log("Making Twilio call")
      params = {"phone_number": '4085109019'}
      Twilio.Device.connect(params)

    $('#hangup').bind "click", (event) ->
      console.log("Hanging up")
      Twilio.Device.disconnectAll()

$ ->
  new TwilioDevice()
