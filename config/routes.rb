SharedBlog::Application.routes.draw do

root to: 'articles#index'
  resources :authors do
    resources :articles do
      resources :comments
    end
  end
end
