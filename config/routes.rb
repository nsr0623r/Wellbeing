Rails.application.routes.draw do
  
  # ユーザー側devise
  devise_for :users, skip: [:passwords], controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  
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
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :commuting_to_hospitals
    resources :graphs, only: [:index, :show]
    resources :calendars, only: [:index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
