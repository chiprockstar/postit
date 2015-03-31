class CategoriesController < ApplicationController
  
  #before_action :set_category, only: [:show, :edit, :update, :create, :new]  
    
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])  
  end
  
  def new
    @category = Category.new  
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Your category was created."
      redirect_to root_path
    else
      render :new
    end

  end
  
  def edit
      
  end
  
  def update
     if @category.update(category_params)
      flash[:notice] = "The Category was updated."
      redirect_to categories_path
    else
      render :edit
    end
      
  end
    
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end  
    
    
end