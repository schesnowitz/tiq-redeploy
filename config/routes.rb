Rails.application.routes.draw do

 
 
  devise_for :company_users, 
  :controllers => { registrations: 'company_users_registrations/registrations'} 
  resources :company_users do
    collection {post :import}
  end
  
  devise_for :shipper_users, 
  :controllers => { registrations: 'shipper_users_registrations/registrations'}
  resources :shipper_users do
    collection {post :import}
  end
  
  devise_for :driver_users, 
  :controllers => { registrations: 'driver_users_registrations/registrations'}
  
  resources :driver_users do
    collection {post :import} 
      resources :driver_statements
        resources 'notifications', only: [:create]  
          # resources :messages 
          #   resources :mobile_users 
              resources :driver_locations 
                resources :trucks, except: [:index] 
                  resources :trailers, except: [:index]  
  end   
  
  resources :users do
    collection {post :import}
  end 
  
  resources :trucks do
    resources :truck_images
      resources :truck_miles
        collection {post :import}
  end  

   
  resources :trailers do
    resources :trailer_images
      resources :trailer_miles
        collection {post :import}
  end
  

  resources :company_profiles do
    collection {post :import}
      resources :mcs 
        resources :carrier_mcs 
          resources :broker_mcs 
            resources :us_dots
              resources :company_profile_memberships
  end
  

   
  resources :loads do
    collection {post :import}
      resources :load_documents, only: [:new, :create, :update] 
        resources :transactions
          resources :addresses 
            resources :load_origin_addresses  
  end 
   

  
  resources :vendor_profiles do
    collection {post :import}
  end   


  resources :driver_statements, only: [:index] do
    collection {post :import}
  end   
  
  
  resources :miles
  # resources :messages
  # resources :text_messages
  # resources :load_to_mobiles 
  resources :app_variables

  get 'company_dashboard', to: 'company_users#company_dashboard'
  get 'company_dashboard', to: 'company_users#company_dashboard'
  get 'driver_dashboard', to: 'driver_users#driver_dashboard'
  get 'shipper_dashboard', to: 'shipper_users#shipper_dashboard'

  
  
  resources :front_pages do
    resources :front_page_texts
  end
  
  root to: "front_pages#show" 
  # get 'driver_users/:id/driver_statements/:id/statement', to: 'driver_statements#statement' , as: 'statement'
  
  get 'driver_user/:driver_user_id/driver_statements/:id/send_statement', to: 'driver_statements#send_statement', as: 'send_statement' 

  get 'loads/send_pdf/:id', to: 'loads#send_pdf', as: 'send_pdf'
  get 'edit_show', to: 'front_pages#edit_show' 
  get 'drivers', to: 'front_pages#drivers' 
  get 'technology', to: 'front_pages#technology' 
  get 'safety', to: 'front_pages#safety' 
  get 'support', to: 'front_pages#support' 
  get 'strategy', to: 'front_pages#strategy' 
  get 'logs', to: 'front_pages#logs'  
    
  # namespace 'api' do
  #   namespace 'v1' do
  #     resources :load_to_mobiles  
  #       # resources :mobile_users  
  #       # resources :driver_users do
  #       #   resources :mobile_users  
  #       # end 
  #   end
  # end


  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => "/sidekiq" 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable' 

end
