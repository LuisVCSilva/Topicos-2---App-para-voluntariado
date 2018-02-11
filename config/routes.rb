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

  resources :metas
   get "/metas/show" => "metas#show"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  mount Thredded::Engine => '/forum'
end
