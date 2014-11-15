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
    $('#sfRentalAmount').text("$#{$('#sfPriceSliderMin').val()} - $#{$('#sfPriceSliderMax').val()}")
    $('#sfSaleAmount').text("$#{$('#sfSalePriceSliderMin').val()} - $#{$('#sfSalePriceSliderMax').val()}")

    rent_slider = $('#sfRentalSlider')
    rent_slider.slider
      range: true
      min: $('#sfPriceSliderMin').data('min')
      max: $('#sfPriceSliderMax').data('min')
      values: [
        $('#sfPriceSliderMin').val()
        $('#sfPriceSliderMax').val()
      ]
      slide: (event, ui) ->
        $('#sfPriceSliderMin').val(ui.values[0])
        $('#sfPriceSliderMax').val(ui.values[1])
        $('#sfRentalAmount').text("$#{ui.values[0]} - $#{ui.values[1]}")
      create: ->
        $('#sfRentalAmount').text("$#{rent_slider.slider("values", 0)} - $#{rent_slider.slider("values", 1)}")

    sale_slider = $('#sfSaleSlider')
    sale_slider.slider
      range: true
      min: $('#sfSalePriceSliderMin').data('min')
      max: $('#sfSalePriceSliderMax').data('min')
      values: [
        $('#sfSalePriceSliderMin').val()
        $('#sfSalePriceSliderMax').val()
      ]
      slide: (event, ui) ->
        $('#sfSalePriceSliderMin').val(ui.values[0])
        $('#sfSalePriceSliderMax').val(ui.values[1])
        $('#sfSaleAmount').text("$#{ui.values[0]} - $#{ui.values[1]}")
      create: ->
        $('#sfSaleAmount').text("$#{sale_slider.slider("values", 0)} - $#{sale_slider.slider("values", 1)}")

  initSlider()

  setSideInfo = ->
    if $('.sfBottom').is(':visible')
      top = 280 - $(window).scrollTop()
    else
      top = 200 - $(window).scrollTop()

    if top <= 0
      top = 20
      $('#ajaxSearchNav').hide()
    else
      $('#ajaxSearchNav').show()

    $('#searchContainer').css({top: "#{top}px"})

  $(document).on 'scroll', ->
    if 710 < $(window).scrollTop() < 1035
      $('#villaAnchorMenu, .villa-reservation').removeClass('normal').addClass('makeFixed fixPosition')
    else
      $('#villaAnchorMenu, .villa-reservation').removeClass('makeFixed fixPosition').addClass('normal')

    setSideInfo()



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
    $('#sfRentalSearchOptions .sfSubRegion').each (region) ->
      checked_regions = $(".selectAll:checked", @)
      if checked_regions.length
        parent_region = $('.selectAll', @)
        regions.push(parent_region.data('label'))
      else
        $(".region3Checkbox:checked", @).each ->
          regions.push($(@).data('label'))

    $('.sfLocation:visible').val(regions.join(', '))

    regions = []
    $('#sfSaleSearchOptions .sfSubRegion').each (region) ->
      checked_regions = $(".selectAll:checked", @)
      if checked_regions.length
        parent_region = $('.selectAll', @)
        regions.push(parent_region.data('label'))
      else
        $(".region3Checkbox:checked", @).each ->
          regions.push($(@).data('label'))

    $('.sfLocation:visible').val(regions.join(', '))

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
    setSideInfo()

  $('#sfRentalInputSearchContainer').on 'click', ->
    conteiner = $(@)
    conteiner.addClass('highlight')
    $('#sfRentalSearchOptions').addClass('open')
    $('#sfRentalSearchOptions').on 'mouseleave', ->
      conteiner.removeClass('highlight')
      $('#sfRentalSearchOptions').removeClass('open')

  $('#sfSaleInputSearchContainer').on 'click', ->
    conteiner = $(@)
    conteiner.addClass('highlight')
    $('#sfSaleSearchOptions').addClass('open')
    $('#sfSaleSearchOptions').on 'mouseleave', ->
      conteiner.removeClass('highlight')
      $('#sfSaleSearchOptions').removeClass('open')

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

  $('#openRentalSearchFilter').on 'click', ->
    $('.headerDropdownWrapper.sale').hide()
    $('.headerDropdownWrapper.sale input').prop('disabled', true)
    $('.headerDropdownWrapper.rental').show()
    $('.headerDropdownWrapper.rental input').prop('disabled', false)

  $('#openSaleSearchFilter').on 'click', ->
    $('.headerDropdownWrapper.rental').hide()
    $('.headerDropdownWrapper.rental input').prop('disabled', true)
    $('.headerDropdownWrapper.sale').show()
    $('.headerDropdownWrapper.sale input').prop('disabled', false)
