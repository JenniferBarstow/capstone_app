Rails.application.routes.draw do
  
   root 'welcome#index'
   resources :users
   resources :classrooms do
      resources :quizzes
      resources :student_invites, only: [:new, :create, :index]
      resources :enrolled_students, only: [:index, :create, :new]
   end

   resources :quizzes, only: [:destroy] do 
      resources :questions
      get 'race', to: "races#show"
      resources :student_quizzes, only: [:index]
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
