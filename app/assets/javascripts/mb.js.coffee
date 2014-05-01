(($) ->
  
  window.mb = 
    EXPANDED: "&#9660;"
    COLLAPSED: "&#9658;"

    #------------------------------------------------------------------------------
    hide_menu: ->
      arrow = $("#add_arrow")
      arrow.html(@COLLAPSED)
      $("#add").slideUp( 250 )

    #------------------------------------------------------------------------------
    show_menu: ->
      arrow = $("#add_arrow")
      arrow.html(@EXPANDED)
      $("#add").slideDown( 250 )

    #------------------------------------------------------------------------------
    flip_menu: ->
      if $("#add:visible").length
        @hide_menu() 
      else
        @show_menu()

) jQuery
