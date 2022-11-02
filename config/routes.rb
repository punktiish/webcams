Rails.application.routes.draw do
  root "webcams#index"
  resources :webcams
  # get "/webcams/:id", to: "webcams#show", as:'webcam'
  # get "/webcams/:id/edit", to: "webcams#edit", as:'edit_webcam'

end
