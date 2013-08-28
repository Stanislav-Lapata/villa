#= require active_admin/base
#= require jstree
#= require jquery.alerts

$ ->
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
    custom:
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
