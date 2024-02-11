class ForemanImageBuilder::BlueprintsController < ::ApplicationController
  def index
    @proxies = ::SmartProxy.with_features('Images')
    @images = {}
    @blueprints = {}
    @proxies.each do |proxy|
      bp_api = ForemanImageBuilder::Blueprints.new(url: proxy.url)
      @images[proxy.id] = bp_api.list_images.group_by { |image| image["blueprint"] }
      @blueprints[proxy.id] = bp_api.all
    end
  end

  def new
    @blueprint = ForemanImageBuilder::Blueprint.new
  end

  def create
    blueprint = ForemanImageBuilder::Blueprint.new(blueprint_params)
    ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).create(blueprint)
    redirect_to blueprints_path
  end

  def build
    ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).build(params[:id])
    redirect_to blueprints_path
  end

  private
    def blueprint_params
      params.require(:blueprint).permit(:name, :description, :packages, :customizations)
    end
end
