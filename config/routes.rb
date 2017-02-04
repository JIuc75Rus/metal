Rails.application.routes.draw do
  resources :orders, olnly: [:new, :create]
  resources :carts, only: [:new, :create, :destroy]
  resources :line_items, only: [:new, :create, :destroy ]
  root to: 'pages#index'
  #jnjlfaskjfsa
  if Rails.env.production?
    match '/404', :to => 'application#page_not_found'
    match '/500', :to => 'application#page_not_found'
  end
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
    resources  :articles, :categories, :subcategories, :itemscategories, except: :show
  end
  resources :call_backs, only: [:new, :create]
  scope '/' do
    resources :categories, only: [:show],  path: '/', as: 'show_category'  do
      resources :subcategories, only: :show, path: '/' do
        resources :itemscategories, only: :show, path: '/'
      end
    end
  end
end