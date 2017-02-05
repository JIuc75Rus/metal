Rails.application.routes.draw do
  resources :orders, olnly: [:new, :create]
  resources :carts, only: [:new, :create, :destroy]
  resources :line_items, only: [:new, :create, :destroy ]
  root to: 'pages#index'
  get '/404', to: 'errors#not_found', via: :all
  get '/500', to: 'errors#internal_error', code: "500"
  #jnjlfaskjfsa
  if Rails.env.production?
    get '/404', to: 'application#page_not_found', via: :all
    get '/500', to: 'application#internal_server_error', via: :all
  end
  get '/404', to:'application#page_not_found', via: :all
  get '/500', to: 'application#internal_server_error', via: :all
  get 'company-info', to: 'pages#company', as: 'company_info'
  get 'contacts', to: 'pages#contact', as: 'contacts'
  get 'feedback', to: 'online_forms#new', as: 'feedback'
  get 'news', to: 'pages#news', as: 'news'
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'
  devise_for :admins, path: '/metal&admin/' do
    get '/metal&admin/sign_out', to: 'devise/sessions#destroy'
  end
  get  '/metal&admin/', to: 'admins#index', as: 'admins'
  resources :online_forms, only: [:new, :create]
  resources :items do
    get :who_bought, on: :member
  end
  scope '/metal&admin' do
    resources  :articles, :categories, :subcategories, except: :show
  end
  resources :call_backs, only: [:new, :create]
  scope '/' do
    resources :categories, only: :show,  path: '/', as: 'show_category'  do
      resources :subcategories, only: :show,  path: '/'
    end
  end
end