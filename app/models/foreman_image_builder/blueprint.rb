module ForemanImageBuilder
  class Blueprint
    extend ActiveModel::Naming
    include ActiveModel::API
    include ActiveModel::Conversion
    include ActiveModel::Translation

    attr_accessor :name, :description, :packages, :customizations

    def self.any?
      true
    end

    def to_key
      name && [name]
    end
  end
end