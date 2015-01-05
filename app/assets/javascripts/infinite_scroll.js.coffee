$ ->

  $(window).scroll () ->
    if page_scroll_at_bottom()
      load_more_posts()

  page_scroll_at_bottom = ->
    scroll_height = $(document).height()
    scroll_position = $(window).height() + $(window).scrollTop()
    return (scroll_height - scroll_position) == 0

  load_more_posts = ->
    $('#loading_gif').show()
    $.getScript "/more_posts"

  # CONSIDER:
  # how to handle no-more-posts condition
  # throttle (debounce?) scroll events
  # put easement buffer into page_scroll_at_bottom
