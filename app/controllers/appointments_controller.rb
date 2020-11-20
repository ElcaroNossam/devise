class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :edit, :show]
  
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :require_appointment, except: [:index, :show]

    def new    
      @appointment = Appointment.new
    end
  
    def create
      
      @appointment = Appointment.new(appointment_params)
      @appointment.user_id = current_user.id
      if @appointment.save 
        flash[:notice] = "Appointment was successfully created but you shoud chose doctor"
        render 'edit'
      else
        render 'new'
      end
    end
  
    def edit
      
    end
  
    def update
      if @appointment.update(appointment_params)
        flash[:notice] = "Appointment was updated successfully"
        redirect_to @appointment
      else
        render 'edit'
      end
    end
  
    def index
      @appointments = Appointment.paginate(page: params[:page], per_page: 5)
    end
  
    def show
      
      @doctors = @appointment.doctors.paginate(page: params[:page], per_page: 5)
    end
    
    def destroy
      @appointment.destroy
      
      flash[:notice] = "This appointment was success destroy!"
      redirect_to appointments_path
    end

    private
  
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:data, :content, :user_id, doctor_ids: [] )
    end
  
    def require_appointment
      if !(user_signed_in? && current_user.role == "user")
        flash[:alert] = "Only admins can perform that action"
        redirect_to appointments_path
      end
    end
end
