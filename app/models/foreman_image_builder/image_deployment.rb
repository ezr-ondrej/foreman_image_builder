module ForemanImageBuilder
  class ImageDeployment
    extend ActiveModel::Naming
    # include ActiveModel::API
    include ActiveModel::Conversion

    attr_accessor :image_id, :system_name

    def self.any?
      true
    end

    def to_key
      image_id && [image_id]
    end

    def initialize(args = {})
      @image_id = args[:image_id]
    end
  end
end