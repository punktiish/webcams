class WebcamsController < ApplicationController
  def index
    @webcams = Webcam.first(49)
  end
end
