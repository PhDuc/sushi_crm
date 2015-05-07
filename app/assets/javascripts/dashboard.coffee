# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Dashboard = @Dashboard || {}

Dashboard.setUp = () ->
  $(document).on 'click', '.account-tables .fa-phone', Dashboard.openMobileModal
  $(document).on 'click', '.call-button', Dashboard.call
  $(document).on 'click', '.edit-account', Dashboard.openEditAccount
  Dashboard.initTwilioClient()

Dashboard.openEditAccount = (event) ->
  $('.edit-account-modal').modal()

Dashboard.openMobileModal = (event) ->
  $('.test-phone').modal(
    backdrop: 'static',
    keyboard: true)

Dashboard.initTwilioClient = ()->
  url = "/dashboard/agent"
  $.getJSON(url, {}, (data) -> $('#twilioToken').val(data.token))

Dashboard.call = () ->
  console.log("Making call")
  Twilio.Device.connect({id: 123})


$ -> Dashboard.setUp()
