class UsersController < ApplicationController
    # Need a 'show' route to view individual users
    get '/users/:id' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

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
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/users/:id'
        else
            redirect 'signup'
        end
    end

    get 'logout' do
        session.destroy
    end

end