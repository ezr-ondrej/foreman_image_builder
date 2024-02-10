module ForemanImageBuilder
  module BlueprintsHelper
    def permitted_blueprint_actions(blueprint)
      actions = []
      # actions << link_to(_("Edit"), edit_foreman_image_builder_blueprint_path(blueprint))
      # actions << link_to(_("Delete"), foreman_image_builder_blueprint_path(blueprint), method: :delete, data: { confirm: _("Are you sure you want to delete this blueprint?") })
      actions << link_to(_("Build"), foreman_image_builder.build_blueprint_path(blueprint), method: :post, data: { confirm: _("Are you sure you want to build this blueprint?") })
      actions
    end
  end
end
