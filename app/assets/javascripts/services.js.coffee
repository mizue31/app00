# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(($)->
  $('#search_key')
    .on("change", (event)->
      $('#search_field').empty()

      $('#search_service').css("display", "none")
      $('#search_server').css("display", "none")
      switch this.value
        when "1"
          $('#search_service').css("display", "block")
        when "2" 
          $('#search_server').css("display", "block")
        else

      $('#search_field').html(this.value)
      $('#search_field').html(html)
    )
)
