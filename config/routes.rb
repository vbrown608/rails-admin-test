Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope :updates do
    get "", to: "updates#index"
    get ":content_type", to: "updates#index"
  end

  scope :deeplinks do
    get ":id", to: "updates#show", as: :blog_post, defaults: { content_type: "BlogPost" }
  end

  scope [:press, :releases] do
    get ":id", to: "updates#show", as: :press_release, defaults: { content_type: "PressRelease" }
  end

  resources :issues, only: :show

  root 'welcome#index'
end
