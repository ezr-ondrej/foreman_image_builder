module ForemanImageBuilder
  class Engine < ::Rails::Engine
    isolate_namespace ForemanImageBuilder
    engine_name 'foreman_image_builder'

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer 'foreman_image_builder.load_app_instance_data' do |app|
      ForemanImageBuilder::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_image_builder.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_image_builder do
        requires_foreman '>= 3.7.0'
        register_gettext

        # Add Global files for extending foreman-core components and routes
        register_global_js_file 'global'

        # Add permissions
        security_block :foreman_image_builder do
          permission :manage_osbuild, { :'foreman_image_builder/images' => [:index, :show, :create, :destroy],
                                                    :'foreman_image_builder/blueprints' => [:index, :show, :create, :destroy],
                                                      :'react' => [:index] }
        end

        # Add a new role called 'Discovery' if it doesn't exist
        role 'ImageBuilder', [:manage_osbuild]

        # add menu entry
        sub_menu :top_menu, :image_builder, icon: 'pficon pficon-enterprise', caption: N_('Images'), after: :hosts_menu do
          menu :top_menu, :blueprints, caption: N_('Image Blueprints'), engine: ForemanImageBuilder::Engine
          menu :top_menu, :images, caption: N_('Images'), engine: ForemanImageBuilder::Engine
        end

        # add dashboard widget
        # widget 'foreman_image_builder_widget', name: N_('Foreman plugin template widget'), sizex: 4, sizey: 1
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do

      begin
        # Host::Managed.send(:include, ForemanImageBuilder::HostExtensions)
        # HostsHelper.send(:include, ForemanImageBuilder::HostsHelperExtensions)
      rescue => e
        Rails.logger.warn "ForemanImageBuilder: skipping engine hook (#{e})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanImageBuilder::Engine.load_seed
      end
    end
  end
end
