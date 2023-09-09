class TagController < ApplicationController

  def index
    @tags = Tag.all

    @tags = Tag.filter(params[:name]) if params[:name].present?

    @tags
  end
end
