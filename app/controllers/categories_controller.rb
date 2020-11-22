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
        flash[:notice] = "Категория созданаб но вам нужно выбрать соответствующих докторов!"
        render 'edit'
      else
        render 'new'
      end
    end
  
    def edit   
    end
  
    def update 
      if @categorie.update(categorie_params)
        flash[:notice] = "Категорея обновлена!"
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
      flash[:notice] = "Категория удалена!"
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
      if !(user_signed_in? && current_user && current_user.has_role?(:admin))
        flash[:alert] = "Только для администратора!"
        redirect_to categories_path
      end
    end
end
