$ ->
  $('.datepicker').datepicker
    showOtherMonths: true
    selectOtherMonths: true
    dateFormat: 'dd/mm/yy'
    yearRange: '-3:0'

  $(document).on "page:fetch", ->
    $("#spinner").show()
  $(document).on "page:change", ->
    $("#spinner").hide()

  bedrooms_label = $('h4#bedrooms')
  bedrooms_label_text = bedrooms_label.text()
  q_bedrooms_gteq = $('#q_bedrooms_gteq').val() || 1
  q_bedrooms_lteq = $('#q_bedrooms_lteq').val() || 10

  $("#bedrooms-slider-range").slider
    range: true
    min: 1
    max: 10
    values: [q_bedrooms_gteq, q_bedrooms_lteq]
    slide: (event, ui) ->
      $("#q_bedrooms_gteq").val(ui.values[0])
      $("#q_bedrooms_lteq").val(ui.values[1])
      bedrooms_label.text("#{bedrooms_label_text}: #{ui.values[0]} - #{ui.values[1]}")

  bedrooms_label.text("#{bedrooms_label_text}: #{q_bedrooms_gteq} - #{q_bedrooms_lteq}")

  price_label = $('h4#price_range')
  price_label_text = price_label.text()
  q_price_gteq = $('#q_price_from_gteq').val() || 0
  q_price_lteq = $('#q_price_from_lteq').val() || 7000

  $("#price-slider-range").slider
    range: true
    min: 0
    max: 7000
    values: [q_price_gteq, q_price_lteq]
    slide: (event, ui) ->
      $("#q_price_from_gteq").val(ui.values[0])
      $("#q_price_from_lteq").val(ui.values[1])
      price_label.text("#{price_label_text}: $#{ui.values[0]} - $#{ui.values[1]}")

  price_label.text("#{price_label_text}: $#{q_price_gteq} - $#{q_price_lteq}")
