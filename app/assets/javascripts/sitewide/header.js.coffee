ready = ->
  $('.dropdown').hover(
    ->
      $(@).find('.dropdown-menu').fadeIn('fast')
  ,
  ->
    $(@).find('.dropdown-menu').fadeOut('fast')
  )

$(document).ready(ready)