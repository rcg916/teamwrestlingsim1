Rails.application.routes.draw do
	root 'games#index'
	resources 'games', only: [:new, :create, :show]
end
