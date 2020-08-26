Rails.application.routes.draw do
  get '/', to: 'items#index'
  get '/edit', to: 'items#edit'
  get '/new', to: 'items#new'
  get '/show', to: 'items#show'
end
