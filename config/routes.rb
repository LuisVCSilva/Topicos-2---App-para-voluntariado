#routes.rb
Rails.application.routes.draw do  
  root to: 'home#show'
  scope path: 'admin' do
    authenticate :user, lambda { |u| u.admin? } do
      mount RailsEmailPreview::Engine, at: 'emails'
    end
  end

  resources :mobilizacao
   post "/mobilizacao/update" => "mobilizacao#update"

  resources :karma
   get "/karma/index" => "karma#index"

  resources :metas
   get "/metas/show" => "metas#show"
   get "/metas/delete" => "metas#delete"

  resources :convite
   get "/convite/index" => "convite#index"


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  mount Thredded::Engine => '/forum'
end
