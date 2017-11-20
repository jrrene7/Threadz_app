class CommentsController < ApplicationController
before_action :require_user
# before_action :set_comment

def index

end

def show

end


def create
  # @comment = @outfits.comment.new(comment_params)
  # @comment = @clothings.comment.new(comment_params)
  # @outfit = Outfit.find(params[:comment][:outfit_id])
  # @clothing = Clothing.find(params[:comment][:clothing_id])
  @comment = Comment.new(comment_params)
  if !@comment.save
    flash[:error] = "Did not save"
  end
  # redirect_back fallback_location: @outfit
  # redirect_back fallback_location: @clothing
  redirect_to clothing_path(params[:comment][:clothing_id])
end


def update
  if @comment.update(comment_params)
    redirect_to @comment
  else
    redirect_back fallback_location: edit-comment_path(@comment)
  end
end

def destroy
  @comment = Comment.find(params[:id])
 @comment.destroy
    redirect_back fallback_location: @comment
end

private
# def set_comment
#   @outfit = Outfit.find(params[:outfit_id])
#   @clothing = Clothing.find(params[:clothing_id])
# end
def comment_params
  params.require(:comment).permit(:content, :clothing_id)
end
end
