class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    erb :'/landmarks/create'
  end

  get '/landmarks/new' do
    
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  put '/landmarks/:id' do

  end

  get '/landmarks/:id/edit' do

  end
end
