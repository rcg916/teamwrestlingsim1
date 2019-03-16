Rails.application.routes.draw do
	root 'games#index'
	resources :games, only: [:new, :create]
	get '/advance', to: 'games#advance'
	get '/playing', to: 'games#show'
	get '/endofyear', to: 'games#endofyear'
end
