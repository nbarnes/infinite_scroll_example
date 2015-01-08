$ ->

  throttle = false

  $(window).scroll () ->
    if page_scroll_at_bottom() && (throttle == false)
      load_more_posts()

  page_scroll_at_bottom = ->
    return $(window).scrollTop() >= $(document).height() - $(window).height()

  load_more_posts = ->
    throttle = true
    setTimeout (-> throttle = false), 1000
    $('#loading_gif').show()
    $.getScript "/more_posts"

  # CONSIDER:
  # how to handle no-more-posts condition
  # put easement buffer into page_scroll_at_bottom
  # how to dynamically adjust posts loaded at a time based on window size