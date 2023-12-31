# Rails.application.routes.draw do


# # 顧客用
# # URL /customers/sign_in ...
# devise_for :customers,skip: [:passwords], controllers: {
#   registrations: "public/registrations",
#   sessions: 'public/sessions'
# }

# # 管理者用
# # URL /admin/sign_in ...
# devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
#   sessions: "admin/sessions"
# }


#   # resources :users, only: [:edit, :show, :index, :update]
#   namespace :public do
#     resources :addresses, only: [:index, :edit, :create, :update, :destroy]
#     resources :orders, only: [:new, :check, :complete,:create, :index, :show]
#     resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
#     resources :customers, only: [:show, :edit, :update,:check, :withdraw]
#     resources :items, only: [:index, :show]
#     root to: 'public/homes#top'
#     get "/about" => "public/homes#about"
#   end

#   namespace :admin do
#     resources :order_details, only: [:update]
#     resources :orders, only: [:update, :show]
#     resources :customers, only: [:index, :show, :edit, :update]
#     resources :genres, only: [:index, :create, :edit, :update]
#     resources :items, only: [:index, :new, :create, :show, :edit, :update]
#     get "/admin" => "admin/homes#top"
#   end


# end



Rails.application.routes.draw do

  root to: 'public/homes#top'
    get "/about" => "public/homes#about"

  scope module: :public do
    resources :items, only: [:index, :show]
  end

  #ユーザーごとのカスタマイズを表示
  scope module: :public do
    #"表示URL"=>"controller#action" で表示ページを記載
    get "customers/my_page" => "customers#show"
    get 'customers/check' => "customers#check"
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:edit, :update]
  end


  scope module: :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end


  scope module: :public do
    get "orders/complete" => "orders#complete"
    post "orders/check" => "orders#check"
    resources :orders, only: [:new,  :create, :index, :show]
  end

  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end



   get "/admin" => "admin/homes#top"

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end


  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end


  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end


  namespace :admin do
    resources :order_details, only: [:update]
  end

get "/admin/orders/history/:id", to: "admin/orders#index", as: "history"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html