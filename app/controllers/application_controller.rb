class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    get '/' do
        erb :index
    end
    
end