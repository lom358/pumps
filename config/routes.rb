Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login'=>'login#new'
  post '/login' =>'login#create'
  get '/logout' => 'login#destroy'

  get '/' => 'home#index'

  resources :pumps_categories, :only => [:index, :show]
  resources :pumps, :only => [:index, :show]

  post '/search' => 'search#search'

  namespace :admin do
    resources :users
    resources :pumps_categories
    resources :pumps
    resources :type_materials, except:[:destroy, :show, :edit]
    get '/process_docs' => 'process_docs#index'
    post '/download_exl' => 'process_docs#download_exl'
    post '/download_csv' => 'process_docs#download_csv'
    get '/' => 'users#index'
  end

  # Для перехвата исключений на сервере
  # get '*a', :to => 'application#not_found'
  # post '*a', :to => 'application#not_found'

end
