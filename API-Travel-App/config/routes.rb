# Rails.application.routes.draw do
#   resources :destinations
#
# end





Rails.application.routes.draw do
  resources :destinations do
    resources :reviews
  end
  get '/most_reviewed' => 'locations#most_reviewed'
end
