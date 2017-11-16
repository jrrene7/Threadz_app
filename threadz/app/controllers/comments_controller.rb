class CommentsController < ApplicationController
before_action :require_user
before_action :set_comment, only: [:update, :destroy]

def index

end

def show

end


def create
  @comment = Comment.new(comment_params)
  @outfit = Outfit.find(params[:comment][:outfit_id])
  @clothing = Clothing.find(params[:comment][:clothing_id])
  unless @comment.save
  end
  redirect_back fallback_location: @outfit
  redirect_back fallback_location: @clothing
end

def update
  unless @comment.update(comment_params)
  end
  redirect_back fallback_location: @comment.clothing
  redirect_back fallback_location: @comment.outfit
end

def destroy
  @comment.destroy
  redirect_back fallback_location: @comment
end

private
def set_comment
  @comment = Comment.find(params[:id])
end
def comment_params
  params.require(:comment).permit(:content, :user_id, :outfit_id, :clothing_id)
end
end
