class SessionsController < ApplicationController
    def new
    end
  
    def create
      doctor = Doctor.find_by(number: params[:session][:number])
      if doctor && doctor.authenticate(params[:session][:password])
        session[:doctor_id] = doctor.id
        flash[:notice] = "Logged in successfully"
        redirect_to doctor
      else
        flash.now[:alert] = "There was something wrong with your login details"
        render 'new'
      end
    end
  
    def destroy
      session[:doctor_id] = nil
      flash[:notice] = "Logged out"
      redirect_to root_path
    end
end
