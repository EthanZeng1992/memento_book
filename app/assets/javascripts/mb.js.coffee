(($) ->
  
  window.mb = 
    EXPANDED: "&#9660;"
    COLLAPSED: "&#9658;"

    #------------------------------------------------------------------------------
    hide_form: (id) ->
      arrow = $("#" + id + "_arrow")
      arrow.html(@COLLAPSED)
      $("#" + id).slideUp(
        250
        ->
          $("#" +id).html("").css height: "auto"
      )

    #------------------------------------------------------------------------------
    show_form: (id) ->
      arrow = $("#" + id + "_arrow")
      arrow.html(@EXPANDED)
      $("#" + id).slideDown(
        250
        ->
          $("#" + id).find(":input[type=text]:first").focus()
      )

    #------------------------------------------------------------------------------
    flip_form: (id) ->
      if $("#" + id + ":visible").length
        @hide_form id
      else
        @show_form id 

) jQuery
