Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/get_current_user', :defaults => { :format => :json }

  devise_for :users, :controllers => {sessions: 'sessions'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :subjects, :defaults => { :format => :json }
  resources :grades, :defaults => { :format => :json }
  resources :divisions, :defaults => { :format => :json }

  resources :teachers, :defaults => { :format => :json } do
    collection do
      get 'subjects_and_divisions'
      get 'get_grades'
    end
  end

  resources :students, :defaults => { :format => :json } do
    collection do
      get 'get_students_grades'
    end
  end

  get 'principals/subjects_and_divisions', :format => :json
  get 'principals/get_grades', :format => :json
  get 'principals/grades_per_subject', :format => :json
  get 'principals/get_student_count_in_divisions', :format => :json

  get 'reports/get_reports'
  get 'reports/view_report/:filename', to: 'reports#view_report'
  get 'reports/generate_report'

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
