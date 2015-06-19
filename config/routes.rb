Rails.application.routes.draw do
  
   root 'welcome#index'
   resources :teachers
   resources :classrooms do
      resources :quizzes
   end

   resources :quizzes, only: [:destroy] do 
      resources :questions
      get 'race', to: "races#show"
   end

   resources :questions, only: [] do
      post 'answer', to: "races#answer"
   end

   resources :students

   get 'sign-in', to: 'authentication#new'
   post 'sign-in', to: 'authentication#create'
   get 'sign-up', to: 'registrations#new'
   post 'sign-up', to: 'registrations#create'
   get 'sign-out', to: 'authentication#destroy'
end
