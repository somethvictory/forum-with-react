class HomeController < ApplicationController
  def index
    @questions = [{title: 'Q1'}, {title: 'Q2'}]
  end
end
