Rails.application.routes.draw do
  post "/image", to: "posts#test"

  resources :posts, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope'/api' do
    get '/posts', to: 'posts#index'
    post '/posts', to: 'posts#create'
    get '/posts/:id', to: 'posts#show'
    put '/posts/:id', to: 'posts#update'
    delete '/posts/:id', to: 'posts#destroy'
    get '/enquiries', to: 'enquiries#index'
    post '/enquiries', to: 'enquiries#create'
    get '/enquiries/:id', to: 'enquiries#show'
    put '/enquiries/:id', to: 'enquiries#update'
    delete '/enquiries/:id', to: 'enquiries#destroy'
    scope '/auth' do
      get '/sign_up', to: 'admins#index' 
      post '/sign_up', to: 'admins#create'
      post '/sign_in', to: 'admins#sign_in'
    end
  end

end
