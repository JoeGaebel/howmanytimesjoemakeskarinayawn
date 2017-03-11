$(document).ready ->
  setInterval(refreshPartial, 1500)

refreshPartial = ->
  $.ajax
    method: 'post'
    url: "score_board/score"
    data:
      yawn:
        increment: false
