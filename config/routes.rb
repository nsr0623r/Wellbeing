Rails.application.routes.draw do
  
  # ユーザー側devise
  devise_for :users, skip: [:passwords], controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  # 管理者側devise
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # ユーザー側routing
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :users do
      get 'my_page' => 'users#show', as: 'my_page'
      get 'information/edit' => 'users#edit', as: 'information_edit'
      patch 'information' => 'users#update', as: 'information'
      get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch 'withdraw' => 'usesrs#withdraw', as: 'withdraw'
    end
    resources :posts
    resources :commuting_to_hospitals
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
