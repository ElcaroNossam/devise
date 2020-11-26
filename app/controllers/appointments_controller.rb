class AppointmentsController < ApplicationController
   
  
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action  :appointment_params, only: [:create, :update]

    def new    
      @appointment = Appointment.new
      
      
    end
  
    def create
      @appointment = Appointment.new(appointment_params)
      @appointment.user_id = current_user.id
      if @appointment.save 
        flash[:notice] = "Запись создана, но вам нужно выбрать имя вашего доктора!"
       render 'edit'
      else
        render 'new'
      end
    end
  
    def edit
      
    end
  
    def update
      if @appointment.update(appointment_params)
        flash[:notice] = "Запись создана!"
       if @appointment.doctors.count > 1 
          redirect_to doctors_path
       else
          @appointment.doctors.each do |doctor|
          redirect_to doctor
         end 
        end
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
      
      flash[:notice] = "Запись успешно удалена!"
      if @appointment.doctors.count == 1
        @appointment.doctors.each do |doctor|
        redirect_to doctor
        end
      else
        redirect_to doctors_path
      end
    end

    private
  
    def set_appointment
      
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:data, :content, :user_id, :stock_id, :doctor_id, doctor_ids: [])
    end
  
    def require_appointment
      if !doctor_signed_in? || !user_signed_in? && current_user && current_user.has_role?(:admin)
        flash[:alert] = "Только после регестрации!"
        redirect_to appointments_path
      end
    end
end
