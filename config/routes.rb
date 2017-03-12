class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end
class SubdomainBlank
  def self.matches?(request)
    request.subdomain().blank?
  end
end


Rails.application.routes.draw do
	
	constraints(SubdomainPresent) do
    root 'static_pages#home'
    devise_for :users
    resources :users, only: :index
  end
  
  constraints(SubdomainBlank) do
    root 'static_pages#home'
    resources :accounts, only: [:new, :create]
    get '/contact', to: 'static_pages#contact'
	  get '/help', to: 'static_pages#help'
	  get '/about', to: 'static_pages#about'
	  get '/signup', to: 'users#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
