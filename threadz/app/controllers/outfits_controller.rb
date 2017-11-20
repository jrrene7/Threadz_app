class OutfitsController < ApplicationController
before_action :require_user
before_action :logged_in, only: [:index, :show, :new, :edit, :update]
before_action :set_outfit, only: [:show, :edit, :update, :destroy]

def index
  @outfits = Outfit.all
end

def show
  @outfit = Outfit.find(params[:id])
end

def new
  @outfit = Outfit.new
end

def create
  @outfit = Outfit.new(outfit_params)
  if @outfit.valid?
    @outfit.save
    redirect_to @outfit
  else
    redirect_back fallback_location: new_outfit_path
  end
end

def edit
  @outfit = Outfit.find(params[:id])
end

def update
  if @outfit.update(outfit_params)
    redirect_to @outfit
  else
    redirect_back fallback_location: edit_outfit_path(@outfit)
  end
end

def destroy
  if @outfit.destroy
    redirect_to outfits_path
  else
    redirect_back fallback_location: @outfit
  end
end

private

def outfit_params
  params.require(:outfit).permit(:name, :occasion, :clothing_id)
end

def set_outfit
  @outfit = Outfit.find(params[:id])
end
end
