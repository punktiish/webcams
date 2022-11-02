include Pagy::Backend
class WebcamsController < ApplicationController
  def index
    @pagy, @webcams = pagy(Webcam.all) # <--- increase this later
    puts "parametri: #{params[":search"]}"
    if params[":search"]
      @pagy, @webcams = pagy(Webcam.search(params[":search"]))
    end
    @categories = {}
    Webcam.distinct.pluck(:category).each do |cat|
      cat.split(",").each do |s|
        if !@categories.include?(s) && s.length > 0
          @categories[s] = false
        end
      end
    end
  end
  
  def show
    @webcam = Webcam.find(params[:id])
  end

  def edit
    @webcam = Webcam.find(params[:id])
  end

  def update
    @webcam = Webcam.find(params[:id])
    if @webcam.update(webcam_params)
      redirect_to @webcam
    else
      render 'edit'
    end
  end

  def destroy
    @webcam = Webcam.find(params[:id])
    @webcam.destroy
    redirect_to root_path
  end

  def new
    @webcam = Webcam.new
  end

  def create
    @webcam = Webcam.new(webcam_params)
    if @webcam.save
      redirect_to @webcam
    else
      render 'new'
    end
  end

  private
    def webcam_params
      params.require(:webcam).permit(:name, :url, :category, :country, :city, :description)
    end
end
