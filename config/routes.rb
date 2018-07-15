Rails.application.routes.draw do


root to:'home#index'
 
  resources :courses
  devise_for :users, :path_prefix => 'my', controllers: { sessions: 'users/sessions' }
  devise_scope :user do
	  get 'sign_in', to: 'devise/sessions#new'
	end
	resources :users do
      collection do
        get 'list_sub_partners', to: "users#list_sub_partners"
        
      end
    end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
