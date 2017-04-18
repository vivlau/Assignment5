Rails.application.routes.draw do
  get 'blog/index'

  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'unlike'
     end
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :authors, only: [:new, :create]

  get('/contact_us', { to: 'contact#new', as: 'contact' })
  # get '/contact_us' =>'contact#new', as: 'contact'

  post('/contact', { to: 'contact#create', as: 'contact_submit' })

  get('/about', { to: 'about#index' })

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blog#index'
end
