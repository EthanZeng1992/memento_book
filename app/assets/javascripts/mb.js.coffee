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

    #------------------------------------------------------------------------------
    hide_add_member: ->
      arrow = $("#arrow_for_member")
      arrow.html(@COLLAPSED)
      $("#add_member").slideUp( 250 )

    #------------------------------------------------------------------------------
    show_add_member: ->
      arrow = $("#arrow_for_member")
      arrow.html(@EXPANDED)
      $("#add_member").slideDown( 250 )

    #------------------------------------------------------------------------------
    flip_add_member: ->
      if $("#add_member:visible").length
        @hide_add_member() 
      else
        @show_add_member()

) jQuery
