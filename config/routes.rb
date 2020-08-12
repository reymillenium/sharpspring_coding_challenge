Rails.application.routes.draw do

  devise_for :users, controllers: {
    # confirmations: 'users/confirmations'
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root :to => redirect("/users/sign_in")

  resources :notes do
    get :clone, on: :member
    get :download_note_as_word, on: :member, defaults: { format: :docx }
  end

  # The extra_pages view (extra)
  get 'extra_pages', to: 'extra_pages#about'

end
