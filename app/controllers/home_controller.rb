class HomeController < ActionController::Base
  def index
    @questions = [{title: 'Q1'}, {title: 'Q2'}]
  end
end
