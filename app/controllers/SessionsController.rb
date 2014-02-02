class SessionsController < ApplicationController
  def new
    #renderöi kirjautumissivun
  end

  def create
    # haetaan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username]
    if user.nil? or not user.authenticate params[:password]
      redirect_to :back, notice: "username and password do not match"
    else
      
      # tallenetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
      session[:user_id] = user.id
      #uudelleenohjataan käyttäjä omalle sivulleen
    redirect_to user_path(user), notice: "Welcome back!"
  end
  
  def destroy
    #nollataan sessio
    session[:user_id] = nil
    #uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end
end
