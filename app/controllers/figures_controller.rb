class FiguresController < ApplicationController
  post '/figures' do

    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []

    unless params[:title][:name].empty?
      titles << Title.create(name: params[:title][:name])
    end

    unless params[:landmark][:name].empty?

    end
    
    figure = Figure.create( name: params[:figure][:name],
                            landmarks: landmarks,
                            titles: titles)
    redirect "figures/#{figure.id}"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
