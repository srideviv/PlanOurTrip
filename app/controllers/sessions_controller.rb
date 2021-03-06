class SessionsController < ApplicationController

  def create
    auth_user = User.find_by_fuid (request.env['omniauth.auth']['uid'])
    if auth_user
      session[:current_user] = auth_user 
      #User is in our database too already
    else
      #He is a new user for our site
      new_user = User.new
      new_user.fuid = request.env['omniauth.auth']['uid']
      new_user.name = request.env['omniauth.auth']['info']['name']
      new_user.email = request.env['omniauth.auth']['info']['email']
      new_user.save
      session[:current_user] = new_user
    end
    user = FbGraph::User.me(request.env['omniauth.auth']['credentials']['token'])
    friends_list = Array.new
    user.friends.each do |f|
      temp = Friend.new
      temp.name = f.name
      temp.fuid = f.identifier
      friends_list << temp
    end
    session[:friends_list] = friends_list
    redirect_to :controller => "user", :action => "show" , :id => session[:current_user].id
  end

end
