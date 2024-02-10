module ForemanImageBuilder
  class Blueprints < ProxyAPI::Resource

    def self.smart_proxies
      @smart_proxies ||= ::SmartProxy.all
    end

    def initialize(args)
      @url = "#{args[:url]}/image_builder"
    end

    def all
      parse(get("blueprints"))["blueprints"]
    end

    def create(blueprints)
      parse(post(blueprint.as_json, "blueprints"))
    end

    def build(blueprint_name)
      image_type = "qcow2"
      build_params = { size: 2024 }
      parse(post(build_params, "blueprints/#{blueprint_name}/build/#{image_type}"))
    end

    def list_images
      parse(get("images"))["finished"]
    end

    def sync_image(name, image_uuid)
      parse(post({ name: name }, "images/#{image_uuid}/sync"))
    end

    def list_systems
      parse(get("systems"))["systems"]
    end

    def deploy_system(name_pattern, image_uuid)
      parse(post({ system_pattern: name_pattern, image_pattern: image_uuid }, "systems"))
    end
  end
end