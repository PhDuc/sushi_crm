# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Home = @Home || {}

Home.setUp = () ->
  $(document).on 'click', '.nav-body-full li', Home.slideToSection
  Home.setHeaderClass()
  $(window).bind 'scroll', ->
    Home.setHeaderClass()

  $(document).on 'click', '.login-button', Home.openLoginModal
  $(document).on 'click', '.login-submit', Home.authenticateUser



Home.slideToSection = (event) ->
  if $(event.target).data('clickable') == 'yes'
    $(event.target).data('clickable', 'no')
    id = '#' + $(event.target).attr('class')
    if _.isEmpty($('.fixed-header'))
      $("html, body").animate({ scrollTop: $(id).offset().top - 150}, 400);
    else
      $("html, body").animate({ scrollTop: $(id).offset().top - 70}, 400);

    window.setTimeout(->
        $(event.target).data('clickable', 'yes')
      , 1000)


Home.setHeaderClass = () ->
  $header = $('.header')
  $headerHeight  = 90
  $header.removeClass('fixed-header')

  if $(window).scrollTop() > $headerHeight
    $header.addClass('fixed-header')

Home.openLoginModal = () ->
  $('.login_result').removeClass('login-failed').removeClass('login-success')
  $('.login_result').html('')
  $('#password').val('')
  $('.modal').removeClass('hidden')
  $('.modal').modal()

Home.closeLoginModal = () ->
  $('.modal').modal('hide')

Home.authenticateUser = () ->
  #default values for the calculator
  params = {
    username: $('#username').val()
    password: $('#password').val()
  }

  url = "/home/user_login"

  $.ajax
    url: url
    type: "GET"
    dataType: 'json'
    data: params

    error: (data) ->
      Home.handleLoginError(data)
    success: (data) ->
      Home.handleLoginSuccess(data)
  false

Home.handleLoginSuccess = (data) ->
  if data["authenticated"] == 'true'
    $('.login_result').removeClass('login-failed').addClass('login-success')
    $('.login_result').html('Login Sucess!')
  else
    $('.login_result').removeClass('login-success').addClass('login-failed')
    $('.login_result').html('Wrong username or password!')

Home.handleLoginError = (data) ->
  $('.login_result').removeClass('login-success').addClass('login-failed')
  $('.login_result').html('An error has occured!')

$ -> Home.setUp()

