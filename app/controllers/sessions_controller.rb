class SessionsController < Devise::SessionsController
  
    #after_sign_in_path_for is called by devise
    def after_sign_in_path_for(user)
      "/home#index" #here we provide
    end
  #the path for the user's profile
end