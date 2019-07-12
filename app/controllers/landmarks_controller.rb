# frozen_string_literal: true

class LandmarksController < ApplicationController
  get "/landmarks" do
    erb :"landmarks/index"
  end

  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
