# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Home = @Home || {}

Home.setUp = () ->
  $(document).on 'click', '.nav-body-full li', Home.slideToSection
  Home.setHeaderClass()
  $(window).bind 'scroll', ->
    Home.setHeaderClass()


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

$ -> Home.setUp()

