class TwilioDevice
  constructor: ->
    @initTwilioDeviceBindings()
    @initFormBindings()

  sleep = (ms) ->
    start = new Date().getTime()
    continue while new Date().getTime() - start < ms

  initTwilioDeviceBindings: ->
    # url = "/dashboard/agent"
    # $.getJSON(url, {}, (data) -> $('#twilioToken').val(data.token))
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
      if error.message['code'] == 31205 #Expired token
        console.log("TOKEN EXPIRED")
        url = '/dashboard/agent'
        oo = $.getJSON(url, {})

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
