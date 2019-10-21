require 'gossip'

class ApplicationController < Sinatra::Base
  	 
	    get '/' do
        erb :index
  	 	end 	
  	 	 
  	 	get '/gossips/new/' do
        erb :new_gossip
  	 	end 		


		post '/gossips/new/' do
		my_gossip = Gossip.new(params[:gossip_author],params[:gossip_content])
		my_gossip.save 
		redirect '/'
		end

		get '/' do
  		erb :index, locals: {gossips: Gossip.all}
		end

		get '/gossips/:id' do
    	erb :show, locals: {
    	id: params["id"],
      	gossip: Gossip.find(params["id"])}
		end

end
