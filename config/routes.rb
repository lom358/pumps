Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login'=>'login#new'
  post '/login' =>'login#create'
  get '/logout' => 'login#destroy'

  namespace :admin do
    resources :users
    resources :pumps_categories, except: [:destroy]
    resources :pumps, :except => [:destroy]
    resources :type_materials, except:[:destroy, :show, :edit]
    get '/process_docs' => 'process_docs#index'
    get '/' => 'users#index'
  end

  # Для перехвата исключений на сервере
  # get '*a', :to => 'application#not_found'
  # post '*a', :to => 'application#not_found'

end
