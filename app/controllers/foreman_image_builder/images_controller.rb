class ForemanImageBuilder::ImagesController < ApplicationController
  def index
    @proxies = ::SmartProxy.with_features('Images')
    @images = ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).list_images
  end

  def sync
    # TODO: Allow custom image name
    ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).sync_image("Fedora", params[:id])
    redirect_to images_path
  end

  def predeploy
    # TODO: Verify existence of image
    @deployment = ForemanImageBuilder::ImageDeployment.new(image_id: params[:id])
    @systems = ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).list_systems

    pp @systems
  end

  def deploy
    ForemanImageBuilder::Blueprints.new(url: ::SmartProxy.all.first.url).deploy_system(params[:system_name], params[:id])
    redirect_to images_path
  end
end
