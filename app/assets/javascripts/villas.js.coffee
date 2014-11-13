$ ->
  $('#submitInfoInq').on 'click', ->
    if $('#tbInfoEmailAddressInq').val().length > 0 && $('#tbInfoFirstNameInq').val().length > 0
      $(@).closest('form').submit()
      alert('Request was successfully sent')
    else
      alert('Fill required fields')

  $('#contact_form_submit').on 'click', ->
    $(@).closest('form').submit()
    alert('Message was successfully sent')

  $('#inquiryNowCalculator').on 'click', ->
    $('#wishListdialog-modal').dialog
      width: 845
      height: 500
      modal: true
      open: ->
        $('#dpInfoCheckInDateInq, #dpInfoCheckOutDateInq').datepicker
          dateFormat: "yy-mm-dd"

  $('#btnDialogClose').on 'click', ->
    $('#wishListdialog-modal').dialog('close')

  initSlider = ->
    if $('.sfFilterType:checked').val() == 'rent'
      min_selector = '#sfPriceSliderMin'
      max_selector = '#sfPriceSliderMax'
      $('#sfSalePriceSliderMin, #sfSalePriceSliderMax').prop('disabled', true)
      $('#sfPriceSliderMin, #sfPriceSliderMax').prop('disabled', false)
    else
      min_selector = '#sfSalePriceSliderMin'
      max_selector = '#sfSalePriceSliderMax'
      $('#sfPriceSliderMin, #sfPriceSliderMax').prop('disabled', true)
      $('#sfSalePriceSliderMin, #sfSalePriceSliderMax').prop('disabled', false)

    $('#sfAmount').text("$#{$(min_selector).val()} - $#{$(max_selector).val()}")

    sliderable = $('#sfSlider')
    sliderable.slider
      range: true
      min: $(min_selector).data('min')
      max: $(max_selector).data('min')
      values: [
        $(min_selector).val()
        $(max_selector).val()
      ]
      slide: (event, ui) ->
        $(min_selector).val(ui.values[0])
        $(max_selector).val(ui.values[1])
        $('#sfAmount').text("$#{ui.values[0]} - $#{ui.values[1]}")
      create: ->
        $('#sfAmount').text("$#{sliderable.slider("values", 0)} - $#{sliderable.slider("values", 1)}")

  initSlider()

  $('.sfFilterType').on 'click', ->
    initSlider()


  $(document).on 'scroll', ->
    if 710 < $(window).scrollTop() < 1035
      $('#villaAnchorMenu, .villa-reservation').removeClass('normal').addClass('makeFixed fixPosition')
    else
      $('#villaAnchorMenu, .villa-reservation').removeClass('makeFixed fixPosition').addClass('normal')

  $('#navDestination, #navContact').on 'click', (e) ->
    if $(@).hasClass('selected')
      $(@).removeClass('selected')
      $('.subs > div', @).hide()
      $('#topNav, #numbers', @).hide()
    else
      $(@).addClass('selected')
      $('.subs > div', @).show()
      $('#topNav, #numbers', @).show()


  $("#infinite-scrolling").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#ajaxResult .villaBlockContainer" # selector for all items you'll retrieve
    extraScrollPx: 100
    loading:
      finishedMsg: "<em>Congratulations, you've reached the end.</em>"
      msgText: "<em>Loading the next set of villas...</em>"
      speed: 'fast'

  generate_regions = ->
    regions = []
    $('.sfSubRegion').each (region) ->
      checked_regions = $(".selectAll:checked", @)
      if checked_regions.length
        parent_region = $('.selectAll', @)
        regions.push(parent_region.data('label'))
      else
        $(".region3Checkbox:checked", @).each ->
          regions.push($(@).data('label'))

    $('#sfLocation').val(regions.join(', '))

  generate_regions()

  $(".region3Checkbox").on "click", ->
    block_container = $(@).closest('.sfSubRegionBlock')
    checked_regions = $(".region3Checkbox:checked", block_container)
    select_all = $('.selectAll', block_container.parent())
    select_all.prop('checked', checked_regions.length == select_all.data('count'))

    generate_regions()

  $('.sfShowHideArea').on 'click', ->
    $('.sfBottom').toggle('show')
    $('.sfMoreBtn').toggle('hide')

  $('#sfInputSearchContainer').on 'click', ->
    conteiner = $(@)
    conteiner.addClass('highlight')
    $('#sfSearchOptions').addClass('open')
    $('#sfSearchOptions').on 'mouseleave', ->
      conteiner.removeClass('highlight')
      $('#sfSearchOptions').removeClass('open')

  $('.selectAll').on 'click', ->
    sub_areas = $(".sub#{@id.split('all-')[1]}")
    checked_sub_areas = $(".sub#{@id.split('all-')[1]}:checked")
    sub_areas.prop('checked', $(@).is(':checked'))
    generate_regions()

  $('#returnDate').datepicker
    dateFormat: "yy-mm-dd"
    onSelect: (val) ->
      $('#dpInfoCheckOutDateInq').val(val);

  $('#departDate').datepicker
    dateFormat: "yy-mm-dd"
    onSelect: (val) ->
      $('#dpInfoCheckInDateInq').val(val);


  $('#sfCheckIn, #sfCheckOut').datepicker
    dateFormat: "yy-mm-dd"
    beforeShow: (input, inst) ->
      $('#ui-datepicker-div').addClass('sfDatepicker')

  $('#dpInfoCheckInDateHm, #dpInfoCheckOutDateHm').datepicker
    dateFormat: "yy-mm-dd"

  $('#readMoreLnk').on 'click', ->
    $('#readLessLnk, #fullview').show()
    $('#shortview, #readMoreLnk').hide()

    $('#readLessLnk').on 'click', ->
      $('#readMoreLnk, #shortview').show()
      $('#fullview, #readLessLnk').hide()

  $('#openSearchFilter').on 'click', ->
    $('.headerDropdownWrapper').toggle('show')
