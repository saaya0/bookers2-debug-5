Rails.application.routes.draw do
 devise_for :users
 get 'home/about' => 'homes#about'
 root 'homes#top'
 resources :users, only: [:show,:index,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   get 'followings'
   get 'followers'
 end
 resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end

 get '/search', to: 'searchs#search'

end
