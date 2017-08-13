Rails.application.routes.draw do
  get 'blogs/index', to: 'blogs#index'
  get 'blogs', to: 'blogs#index'
  post 'blogs/create'
  get 'blogs/show/:id', to: 'blogs#show'
  post 'replies/create/:id', to: 'replies#create'
  get 'blogs/like/:id', to: 'blogs#like'
end
