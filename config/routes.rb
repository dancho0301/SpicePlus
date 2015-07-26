Rails.application.routes.draw do

  # redactor
  resources :redactor_assets
  post "redactor_assets/create"

  get 'sessions/new'

  get 'static_pages/about'
  get 'static_pages/recruitment'
  get 'static_pages/contact'

  # devise_for :users

  root "main#index"

  get 'articles', :to => 'articles#index'
  get 'articles(/:id)', :to => 'articles#show', :as => 'article'

  # お問い合わせ
  get  "inquiry" => "inquiry#index"               # 入力
  get  "inquiry/article/:article_id" => "inquiry#article" # 記事からの問い合わせ
  post "inquiry/confirm" => "inquiry#confirm"     # 確認
  post "inquiry/thanks" => "inquiry#thanks"       # 完了

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  get :admin, to: "admin#index", as: "admin_root"
  namespace :admin do
    resources :articles, shallow: true do
      resources :reports
    end
    # get "reports" => "reports#show"
    resources :article_images
    resources :groups
    resources :areas
    resources :genres
    resources :spices
  end

  # 認証系
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  get "secret" => "home#secret", :as => "secret"

end
