# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Home = @Home || {}

Home.setUp = () ->
  $(document).on 'click', '.nav-body-full li', Home.slideToSection
  $(document).on 'click', '#mobile-nav-links li', Home.slideToSection
  $(document).on 'click', '#dropdownMenu1', Home.toggleDropdown
  $(document).on 'keydown', '.form__field input', Home.submitForm
  Home.setHeaderClass()
  $(window).bind 'scroll', ->
    Home.setHeaderClass()

  $(document).on 'click', '.login-button, .login-link', Home.openLoginModal
  $(document).on 'click', '.login-submit', Home.authenticateUserWithWait

  $(document).on 'focusout', '.form__field input', Home.preserveFormInput

Home.submitForm = (event) ->
  if event.keyCode == 13
    $(event.target).parent().siblings().closest('.login-submit').click()

Home.preserveFormInput = (event) ->
  _.each $('.form__field input'), (input) ->
    if ($(input).val().length != 0)
      $(input).addClass('filled')
    else
      $(input).removeClass('filled')

Home.toggleDropdown = (event) ->
  cookie_data = Home.readCookie()
  if cookie_data['mobile_nav_opened'] == undefined
    cl = $('#mobile-nav-links').attr('class')
    Home.setCookie('mobile_nav_opened', (!_.include(cl, 'hidden')).toString(), 1)
    cookie_data = Home.readCookie()
    if cookie_data['mobile_nav_opened'] == 'false'
      $('#mobile-nav-links').removeClass('hidden')
    else
      $('#mobile-nav-links').addClass('hidden')

Home.slideToSection = (event) ->
  $('#mobile-nav-links').addClass('hidden')
  if $(event.target).data('clickable') == 'yes'
    $(event.target).data('clickable', 'no')
    id = '#' + _.last($(event.target).attr('class').split(' '))
    if _.isEmpty($('.fixed-header'))
      $("html, body").animate({ scrollTop: $(id).offset().top - 150}, 400);
    else
      $("html, body").animate({ scrollTop: $(id).offset().top - 70}, 400);

    window.setTimeout(->
        $(event.target).data('clickable', 'yes')
      , 400)


Home.setHeaderClass = () ->
  $header = $('.full-header')
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

Home.authenticateUserWithWait = () ->
  document.getElementById('login-submit').disabled = true
  $('#login-submit').html("Waiting...")
  setTimeout((-> Home.authenticateUser()), 1000)

Home.authenticateUser = () ->
  #default values for the calculator
  # document.getElementById('login-submit').disabled = 'true'
  # $('#login-submit').html("Waiting...")
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

  document.getElementById('login-submit').disabled = false
  $('#login-submit').html("LOGIN »")
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

Home.setCookie = (name, value, time_in_sec) ->
  d = new Date()
  d.setTime(d.getTime() + 1000*time_in_sec)
  data = name + '=' + value + '; expires=' + d.toUTCString()
  document.cookie = data

Home.readCookie = () ->
  data = {}
  current_cookie = document.cookie
  list = current_cookie.split(';')
  _.each list, (element) ->
    pairs = element.split('=')
    if pairs.length == 2
      data[$.trim(pairs[0].toString())] = $.trim(pairs[1].toString())
  return data

$ -> Home.setUp()

