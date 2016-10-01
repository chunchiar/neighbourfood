generalFunctions = () ->
    # tallest = 0;
    # $('.menu-item').each (index, element) ->
    #   if($(element).height() > tallest)
    #     tallest = $(element).height()
    #
    # $('.menu-item .inner').each (index, element) ->
    #   $(element).css("height",tallest+"px");

  $(document).on 'turbolinks:load', generalFunctions
