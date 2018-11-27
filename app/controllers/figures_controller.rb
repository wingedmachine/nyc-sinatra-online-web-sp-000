class FiguresController < ApplicationController
post '/figures' do
  binding.pry
end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
