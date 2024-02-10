class ForemanImageBuilder::BlueprintsController < ::ApplicationController
  def index
    @blueprints = ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).all
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
