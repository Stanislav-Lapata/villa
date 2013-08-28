App.directive "ngAmpereDebounce", [->
  DEFAULTS = timeout: 500
  restrict: "A"
  link: (scope, element, attrs) ->

    # normalize directive options
    options = scope.$eval(attrs.ngAmpereDebounce) or $.extend({}, DEFAULTS)
    if options is "leading"
      options = $.extend(
        leading: true
      , DEFAULTS)
    else
      options.leading = !!options.leading # make it a real boolean
    map = $._data(element[0], "events")
    events = $.each(Object.keys(map), (index, eventName) ->

      # ensure only real events are handled
      unless eventName.charAt(0) is "$"

        # install debounce mechanism
        debounced = $.debounce(options.timeout, options.leading, (event) ->

          #console.log( 'debounce called');

          # iterate over all event handlers registered before ourself
          # (remember : we moved ourself at first position while installing)
          i = $.inArray(debounce_handlerobj, map[eventName]) + 1

          while i < map[eventName].length
            handlerobj = map[eventName][i]

            # call original event handler
            handlerobj.handler.apply this, arguments

            # emulate regular event dispatching by
            # aborting further propagation when event
            # has state immediatePropagationStopped
            break  if event.isImmediatePropagationStopped()
            i++
        )
        element.on eventName, (event) ->
          debounced.apply this, arguments

          # tell jquery to suppress further propagation of this event
          event.stopImmediatePropagation()


        # move our debounce handler at first position
        # to be called before any other
        debounce_handlerobj = map.input.pop()
        map.input.unshift debounce_handlerobj
    )
]
