class SiteController < ApplicationController
  def home
    @user_name = current_user ? current_user.name : "User"
  end

  def contact
    # render :contact
  end
end
