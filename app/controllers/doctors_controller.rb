class DoctorsController < ApplicationController
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]
    
   
  
    def show
      @categories = @doctor.categories.paginate(page: params[:page], per_page: 5)
    end
  
    def index
      @doctors = Doctor.paginate(page: params[:page], per_page: 5)
    end
  
    def new
      @doctor = Doctor.new
    end
  
    def edit
    end
  
    def update
      if @doctor.update(doctor_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to @doctor
      else
        render 'edit'
      end
    end
  
    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        flash[:notice] = "Welcome to the Alpha Blog #{@doctor.name}, you have successfully signed up"
        redirect_to categories_path
      else
        render 'new'
      end
    end
  
    def destroy
      @doctor.destroy
      session[:doctor_id] = nil if @doctor == current_doctor
      flash[:notice] = "Account and all associated articles successfully deleted"
      redirect_to articles_path
    end
  
    private
    def doctor_params
      params.require(:doctor).permit(:name, :number, :email, :password, category_ids: [])
    end
  
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end
  
    def require_doctor
      if current_doctor != @doctor 
        flash[:alert] = "You can only edit or delete your own account"
        redirect_to @doctor
      end
    end
end
