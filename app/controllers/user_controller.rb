class UsersController < ApplicationController
    # Need a 'show' route to view individual users

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect '/'
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do

    end

    get 'logout' do

    end

end