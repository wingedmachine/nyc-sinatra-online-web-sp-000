class FiguresController < ApplicationController
  post '/figures' do
    if params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      params[:figure][:title_ids] << new_title.id
      binding.pry
    end

    if params[:landmark][:name].empty?

    end

    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    binding.pry
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []
    figure = Figure.create(landmarks: landmarks, titles: titles)
    redirect "figures/#{figure.id}"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
