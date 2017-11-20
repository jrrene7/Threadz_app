class ClothingsController < ApplicationController
before_action :require_user
before_action :logged_in, only: [:index, :show, :edit, :new, :update]
before_action :set_clothing, only: [:show, :edit, :update, :destroy]

def index
  @clothings = Clothing.all
end

def show
  @comments = @clothing.comments.order(:created_at)
  @comment = @clothing.comments.new(:user_id => @current_user.id)
end

def new
  @clothing = Clothing.new
  @outfits = Outfit.all
end

def create
  @clothing = Clothing.new(clothing_params)
  if @clothing.valid?
    @clothing.save
    redirect_to @clothing
  else
    redirect_back fallback_location: new_clothing_path
  end
end

def edit
  @clothing = Clothing.find(params[:id])
  @outfits = Outfit.all
end

def update
  if @clothing.update(clothing_params)
    redirect_to @clothing
  else
    redirect_back fallback_location: edit_clothing_path(@clothing)
  end
end

def destroy
  if @clothing.destroy
    redirect_to clothings_path
  else
    redirect_back fallback_location: @clothing
  end
end


def search
  @clothings = Clothing.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%").order(:name)
  render :json => {:clothings => @clothings}
end

private

def clothing_params
  params.require(:clothing).permit(:name, :kind, :image, :outfit_id)
end

def set_clothing
  @clothing = Clothing.find(params[:id])
end
end
