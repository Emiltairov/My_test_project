Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :feedbacks do
    resources :feedbacks, :path => '', :only => [:index, :new, :create]
  end

  # Admin routes
  namespace :feedbacks, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :feedbacks do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :feedbacks do
    resources :settings, :only => [:index, :show]
  end

  # Admin routes
  namespace :feedbacks, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/feedbacks" do
      resources :settings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end