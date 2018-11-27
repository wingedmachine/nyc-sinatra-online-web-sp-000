class FiguresController < ApplicationController
  post '/figures' do
    unless params[:title][:name].empty?

    end

    unless params[:landmark][:name].empty?

    end

    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []
    figure = Figure.create(landmarks: landmarks, titles: titles)
    binding.pry
    redirect "figures/#{figure.id}"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
