module ForemanImageBuilder
  class Blueprint
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name, :string
    attribute :description, :string
    attribute :distro, :string
    attribute :version, :string
    attribute :packages, array: true
    attribute :modules, array: true
    attribute :groups, array: true
    attribute :customizations, :string

    def self.any?
      true
    end

    def id
      name
    end

    def to_param
      name
    end

    def customizations=(value)
      super value.to_json
    end

    def customizations
      JSON.parse(super)
    end
  end
end