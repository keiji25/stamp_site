Rails.application.routes.draw do
  resources :staffs do
    collection {post :import}
  end
  get 'adminimanages/in'
  get 'adminimanages/ticket_qr'
  get 'adminimanages/index'
  get 'adminimanages/auto'
  get 'adminimanages/success_in'
  get 'adminimanages/success_out'
  get 'adminimanages/form'
  post 'adminimanages/form' => 'adminimanages#create'
  get 'adminimanages/out'
  post 'adminimanages/success'
  get 'adminimanages/error'
  get 'tyusen/hinamatsuri' => 'tyusens#hinamatsuri'
  get 'tyusen/valentine' => 'tyusens#valentine'
  post 'tyusens/lottery'
  resources :supports
  resources :stamps
  get 'site_infos' => 'site_infos#index'
  get 'users/index'
  get 'users/show'
  resources :prizes
  root 'homes#index'
  devise_for :users, :controllers => {
    :registrations => 'devise_users/registrations'
   }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  get 'homes/index'

  get 'setting' => 'homes#setting'

  get 'info' => 'homes#info'

  get 'mmmf_terms' => "helps#mmmf_terms"
  
  get 'contact' => "helps#contact"
  get 'helps/announce' => "helps#announce"
  get "helps/support"

  get 'get/stamp/:id' => 'get#stamp'
  get 'get/logs'

  get '*path', controller: 'application', action: 'render_404'
  post '*not_found', controller: 'application', action: 'routing_error'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
