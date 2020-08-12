Rails.application.routes.draw do

  devise_for :users, controllers: {
    # confirmations: 'users/confirmations'
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Works:
  # root to: "notes#index"

  # *** None of these works: ***
  #
  # With devise
  # root to: "devise/sessions#new"
  # root to: "devise/sign_in"
  #
  # With users:
  # Almost
  # root to: "users/sessions#new"
  # root to: "users/sessions/new"
  # ArgumentError Missing :controller key on routes definition, please check your routes.
  # root to: "users/sign_in"
  # Routing Error uninitialized constant UsersController
  # root to: "users#sign_in"
  # root to: "users/login"
  #
  # With user:
  # root to: "user/sessions#new"
  # Missing :controller key on routes definition, please check your routes.
  # No route matches [GET] "/"
  # root to: "user/sign_in"
  #
  # With sessions:
  # root to: "sessions#new"
  # Unknown action
  # Could not find devise mapping for path "/". This may happen for two reasons
  # root :to => "devise/sessions#new"
  #
  # Others:
  # root to: new_user_session_path
  # root to: user_session_path
  # root 'landing#index'
  #
  # Redirecting:
  # root :to => redirect("/users/login")
  # Ok
  root :to => redirect("/users/sign_in")

  # No sirven
  # devise_scope :users do
  #   # root to: "devise/sessions#new"
  #   root to: "users/sessions#new"
  # end

  # devise_for :users do
  #   get "/", :to => "devise/sessions#new"
  # end
  # root :to => "users/sessions#new"

  # devise_scope :users do
  #   root :to => 'users/sessions#new'
  # end
  #
  resources :notes do
    get :clone, on: :member
  end
end
