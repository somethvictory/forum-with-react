class TagController < ApplicationController
  def index
    tags = Tag.all

    tags = Tag.filter(params[:name]) if params[:name].present?

    render json: tags
  end

  def create
    tag = Tag.new(tag_params)
    tag.save

    render json: tag
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
