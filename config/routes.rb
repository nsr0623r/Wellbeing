Rails.application.routes.draw do

  # ユーザー側devise
  devise_for :users, skip: [:passwords], controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  
  # 管理者側devise
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # ユーザー側routing
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :users, only: [] do
      get 'my_page' => 'users#show', as: 'my_page'
      get 'information/edit' => 'users#edit', as: 'information_edit'
      patch 'information' => 'users#update', as: 'information'
      get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch 'withdraw' => 'users#withdraw', as: 'withdraw'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'relationships/followings'
    get 'relationships/followers'
    resources :commuting_to_hospitals
    resources :graphs, only: [:index, :show]
    resources :calendars, only: [:index]
    resources :history_of_births
    resources :health_histories
    resources :medication_histories
    resources :vaccination_histories
  end
  
  # 管理者側routeing
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update]
  end
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
