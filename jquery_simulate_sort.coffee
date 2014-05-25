event = (name, x, y, options = {}) ->
  options = $.extend(
    pageX: x
    pageY: y
  , options)
  new $.Event(name, options)

out_of_limits = (position, min, max) ->
  position < min or position > max

over_target_placeholder = (container, target_position, direction) ->
  placeholder = container.find '.ui-sortable-placeholder'
  position = placeholder.index()
  position += 1 if direction == -1
  position == target_position

window.jquery_simulate_sort = (element, position) ->

  container = element.parent()

  source_point = element.offset()
  from_x = source_point.left
  from_y = source_point.top
  element.trigger event('mousedown', from_x, from_y, which: 1)

  target_element = $ container.children().get(position - 1)
  target_point = target_element.offset()

  x = Math.ceil((target_element.width() - target_point.left) / 2 )
  y = source_point.top

  minimum_y = - element.height()
  maximum_y = $(document).height() + element.height()

  current_position = element.index() + 1
  direction = if current_position > position then -1 else 1

  interval = setInterval ->
    $(document).trigger event('mousemove', x, y)

    y += 1 * direction

    # are we there yet?
    if over_target_placeholder(container, position, direction) or out_of_limits(y, minimum_y, maximum_y)
      clearInterval(interval)
      element.trigger event('mouseup', x, y)

  , 0

