class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update, :destroy, :edit ]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

    def new
      @categorie = Category.new
    end
  
    def create
      @categorie = Category.new(categorie_params)
      if @categorie.save
        flash[:notice] = "Categorie was successfully created but you should chose doctor!"
        render 'edit'
      else
        render 'new'
      end
    end
  
    def edit   
    end
  
    def update 
      if @categorie.update(categorie_params)
        flash[:notice] = "Categorie name updated successfully"
        redirect_to @categorie
      else
        render 'edit'
      end
    end
  
    def index
      @categories = Category.paginate(page: params[:page], per_page: 5)
    end
  
    def show
      @doctors = @categorie.doctors.paginate(page: params[:page], per_page: 5)
    end
    
    def destroy
      @categorie.destroy
      flash[:notice] = "This categorie was success destroy!"
      redirect_to categories_path
    end

    private
  
    def set_article
      @categorie = Category.find(params[:id])
    end

    def categorie_params
      params.require(:category).permit(:name, doctor_ids: [])
    end
  
    def require_admin
      if !(user_signed_in? && current_user.role == "admin")
        flash[:alert] = "Only admins can perform that action"
        redirect_to categories_path
      end
    end
end
