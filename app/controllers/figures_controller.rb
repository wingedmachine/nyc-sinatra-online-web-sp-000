class FiguresController < ApplicationController
  post '/figures' do
    binding.pry
    unless params[:title][:name].empty?
      binding.pry
      new_title = Title.create(name: params[:title][:name])
      params[:figure][:title_ids] << new_title.id
    end

    unless params[:landmark][:name].empty?

    end

    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []
    figure = Figure.create(name: params[:figure][:name], landmarks: landmarks, titles: titles)
    redirect "figures/#{figure.id}"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
