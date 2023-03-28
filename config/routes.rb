Rails.application.routes.draw do

  resources :messages
  resources :conversations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  root 'pages#landing'
  post '/', to: 'pages#landing'

  post 'update_university', to: 'pages#update_university'

  get 'students/show', to: 'students#show'
  post 'students/show', to: 'students#show'

  get 'students/details', to: 'students#details'

  get 'ratings/index', to: 'ratings#index'

  post 'ratings/create', to: 'ratings#create'
  get 'ratings/new', to: 'ratings#new'

  # get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"


  # get 'messages/index', to: 'messages#index'
  # resources :messages
  #
  # get 'students/conversations/index', to: 'conversations#index'
  # resources :conversations

  # post '/', to: 'application#landing'

  resources :conversations do
    resources :messages
  end

  get 'students/index', to: 'students#index'
  resources :students

  get 'scores/index', to: 'scores#index'
  resources :scores

  get 'educations/index', to: 'educations#index'
  resources :educations

  get 'student_applications/index'
  resources :student_applications
  post 'student_applications/save_application'

  get 'programs/index'
  resources :programs

  get 'admin', to: 'pages#admin'
  post 'pages/update_users', to: 'pages#update_users'


  #get 'students/:id/edit', to: 'students#edit', as: 'edit_student' # edit
  patch 'students/:id', to: 'students#update'                          # update (as needed)
  put 'students/:id', to: 'students#update'

  get 'faculty/index', to: 'student_applications#faculty_index'

  post 'ratings/create_from_application', to: 'ratings#create_from_application'
  post 'application/update_status', to: 'student_applications#update_status'

  get 'ratings/application', to: 'ratings#show_application_ratings'
  get 'ratings/user', to: 'ratings#show_user_ratings'

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
end
