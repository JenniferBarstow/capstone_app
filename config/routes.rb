Rails.application.routes.draw do
  
   root 'welcome#index'
   resources :users
   resources :classrooms
   resources :quizzes

   get 'sign-in', to: 'authentication#new'
   post 'sign-in', to: 'authentication#create'
   get 'sign-up', to: 'users#new'
   post 'sign-up', to: 'users#create'
   get 'sign-out', to: 'authentication#destroy'

  
end
