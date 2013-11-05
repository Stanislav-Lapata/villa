#= require active_admin/base
#= require angular
#= require angular-resource
#= require angular-route
#= require angular-sanitize
#= require angular-google-maps
#= require app

#= require ap.fotorama
#= require_tree ./angular
#= require jstree
#= require jquery.alerts
#= require select2

$ ->
  $('.sortable').sortable
    update: (event, ui) ->
      window.test = ui
      positions = {}
      $.each $(".admin-villa-form-images", $(@)), (position, obj) ->
        window.obj = obj
        reg = /(\w+_?)+_(\d+)/
        parts = reg.exec($(obj).attr("id"))
        positions["positions[" + parts[2] + "]"] = position  if parts

      $.ajax
        type: "POST"
        dataType: "script"
        url: $(ui.item).data("sortable-link")
        data: positions


  areaFormatResult = (area) ->
    area.pretty_name

  $('.admin-villa-area').select2
    width: 'element'
    placeholder: "Select Area"
    ajax:
      url: "/api/areas/for_admin.json"
      data: (term, page) ->
        q:
          name_cont: term

      results: (data, page) -> # parse the results into the format expected by Select2.
        # since we are using custom formatting functions we do not need to alter remote JSON data
        results: data

    initSelection: (element, callback) ->

      # the input tag has a value attribute preloaded that points to a preselected movie's id
      # this function resolves that id attribute to an object that select2 can render
      # using its formatResult renderer - that way the movie name is shown preselected
      id = $(element).val()
      if id isnt ""
        $.ajax("/api/areas/#{id}.json",).done (data) ->
          callback data


    formatResult: areaFormatResult
    formatSelection: areaFormatResult
    dropdownCssClass: "bigdrop"
    escapeMarkup: (m) -> # we do not want to escape markup since we are displaying html in results
      m

  handle_move = (e, data) ->
    last_rollback = data.rlbk
    position = data.rslt.cp
    node = data.rslt.o
    new_parent = data.rslt.np

    url = "/admin/areas/#{node.attr("id")}"
    $.ajax
      type: "POST",
      dataType: "json",
      url: url.toString(),
      data: ({_method: "put", "area[parent_id]": new_parent.attr("id"), "area[position]": position }),

    true

  handle_create = (e, data) ->
    alert "asd"
    last_rollback = data.rlbk
    node = data.rslt.obj
    name = data.rslt.name
    position = data.rslt.position
    new_parent = data.rslt.parent

    $.ajax
      type: "POST",
      dataType: "json",
      url: '/admin/areas',
      data: ({"area[name]": name, "area[parent_id]": new_parent.attr("id"), "area[position]": position }),
      success: (data,result) ->
        node.attr('id', data.id)

  handle_rename = (e, data) ->
    last_rollback = data.rlbk
    node = data.rslt.obj
    name = data.rslt.new_name

    url = '/admin/areas'
    url = url + '/' + node.attr("id")

    $.ajax
      type: "POST",
      dataType: "json",
      url: url.toString(),
      data: {_method: "put", "area[name]": name },

  handle_delete = (e, data) ->
    last_rollback = data.rlbk
    node = data.rslt.obj
    delete_url = "/admin/areas/#{node.attr('id')}"
    jConfirm 'Are you sure want to delete this area?', 'Removal confirmation', (r) ->
      if r
        $.ajax
          type: "POST",
          dataType: "json",
          url: delete_url,
          data: {_method: "delete"},
      else
        $.jstree.rollback(last_rollback)
        last_rollback = null

  tree_menu = (obj, context) ->
    create:
      label: 'Create',
      action: (obj) -> context.create(obj)
    rename:
      label: "<i class='icon-pencil'></i> " + 'Rename',
      action: (obj) -> context.rename(obj)
    remove:
      label: "<i class='icon-trash'></i> " + 'Remove',
      action: (obj) -> context.remove(obj)
    edit:
      separator_before: true,
      label: "<i class='icon-edit'></i> " + 'Edit',
      action: (obj) -> window.location = "/admin/areas/#{obj.attr("id")}/edit"

  $('#sortable').jstree(
    themes:
      theme: 'apple'
      bg: false
    contextmenu:
      items: (obj) ->
        tree_menu(obj, this)
    plugins: ['themes', 'html_data', 'ui', 'crrm', 'dnd', 'contextmenu']
    ).bind("move_node.jstree", handle_move)
    .bind("remove.jstree", handle_delete)
    .bind("create.jstree", handle_create)
    .bind("rename.jstree", handle_rename)
    .bind "loaded.jstree", ->
      window.test = $(@)
      $(this).jstree("core").toggle_node($('.jstree-icon'))

  toggle_rental_show = ->
    if $('#villa_rental').is(':checked')
      $('#villa_price_from_input, #villa_price_to_input').show('300')
    else
      $('#villa_price_from_input, #villa_price_to_input').hide('300')

  toggle_sale_show = ->
    if $('#villa_sale').is(':checked')
      $('#villa_sale_price_input').show('300')
    else
      $('#villa_sale_price_input').hide('300')

  toggle_rental_show()
  toggle_sale_show()

  $('#villa_rental').click (e) ->
    toggle_rental_show()

  $('#villa_sale').click (e) ->
    toggle_sale_show()
