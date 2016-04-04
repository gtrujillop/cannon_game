Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth' => 'auth#authenticate'
      resources :subjects, except: [:new, :edit]
      resources :session_resources, except: [:new, :edit]
      resources :user_sessions, except: [:new, :edit]
      resources :user_session_tokens, except: [:new, :edit]
      resources :user_packages, except: [:new, :edit]
      resources :packages, except: [:new, :edit]
      resources :sessions, except: [:new, :edit]
      resources :users, except: [:new, :edit]
      match 'users/:id/packages', to: 'packages#by_user', via: :get
    end
  end
end
