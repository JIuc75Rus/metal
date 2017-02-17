Rails.application.routes.draw do
  resources :call_backs, only: [:new, :create]
  resources :online_forms, only: [:new, :create]
  constraints(host: /metal22.ru/) do
    get '*', to: redirect('http://www.metal22.ru')
  end
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
  get 'about', to: 'pages#company', as: 'company_info'
  get 'kontakty', to: 'pages#contact', as: 'contacts'
  get 'catalog', to: 'pages#products', as: 'products'
  get 'mail', to: 'online_forms#new', as: 'feedback'
  get 'news', to: 'pages#news', as: 'news'
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'
  devise_for :admins, path: '/metal&admin/' do
    get '/metal&admin/sign_out', to: 'devise/sessions#destroy'
  end
  get  '/metal&admin/', to: 'admins#index', as: 'admins'
  scope '/metal&admin' do
    resources  :articles, except: :show
    resources :categories, except: :show
    resources :subcategories, except: :show
    resources :adverts
    resources :items
  end
  scope '/' do
    resources :categories, only: :show,  path: '/', as: 'show_category'  do
      resources :subcategories, only: :show,  path: '/'
    end
  end
end