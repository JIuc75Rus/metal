Rails.application.routes.draw do
  root to: 'pages#index'
  #jnjlfaskjfsa
  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
  end
  get 'company-info', to: 'pages#company', as: 'company_info'
  get 'contacts', to: 'pages#contact', as: 'contacts'
  get 'feedback', to: 'online_forms#new', as: 'feedback'
  get 'news', to: 'pages#news', as: 'news'
  get 'categories/:id', to: 'pages#show', as: 'category_show'
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'
  devise_for :admins, path: '/metal&admin/' do
    get '/metal&admin/sign_out', to: 'devise/sessions#destroy'
  end
  get  '/metal&admin/', to: 'admins#index', as: 'admins'
  resources :online_forms, only: [:new, :create]
  resources :items, path: '/metal&admin/items/'
  resources :call_backs, only: [:new, :create]
  resources :articles, path: '/metal&admin/news/'
  resources :categories, path: '/metal&admin/cat/'
end