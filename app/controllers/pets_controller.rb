class PetsController < ApplicationController

  def index
    if @user ||= current_user
      @pets = @user.pets
    end
  end

end
