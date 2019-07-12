# frozen_string_literal: true

class FiguresController < ApplicationController
  get "/figures" do
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.new(params[:figure])
    title = Title.find_or_create_by(name: params[:title][:name]).id
    @figure.title_ids = title unless params[:title][:name].empty?
    lm = Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.landmarks << lm unless params[:landmark][:name].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    title = Title.find_or_create_by(name: params[:title][:name]).id
    @figure.title_ids = title unless params[:title][:name].empty?
    lm = Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.landmarks << lm unless params[:landmark][:name].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
