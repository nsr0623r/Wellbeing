Rails.application.routes.draw do
  
  # ユーザー側devise
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者側devise
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # ユーザー側devise
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
