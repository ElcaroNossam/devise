class StocksController < ApplicationController
    

    before_action :authenticate_user!, only: [:create, :update, :destroy, :edit ]
    before_action :set_stock, only: [:show, :edit, :update, :destroy]

    def search
        if params[:stock].present?
           @stock = Stock.find_by(namedoctor: params[:stock].capitalize)
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/result' }
                end 
            else
                respond_to do |format|
                    flash.now[:alert] = "Please enter a valid name to search"
                    format.js { render partial: 'users/result' }
                end
             end
        else
            respond_to do |format|
                flash.now[:alert] = "Please enter a name to search"
                format.js { render partial: 'users/result' }
            end
        end
    end
    def new    
        @stock = Stock.new
      end
    
      def create
        @stock = Appointment.new(appointment_params)
       
        if @stock.save 
          flash[:notice] = "Appointment was successfully created but you shoud chose doctor"
          render 'edit'
        else
          render 'new'
        end
      end
    
      def edit
        
      end
    
      def update
        if @stock.update(stock_params)
          flash[:notice] = "Appointment was updated successfully"
          redirect_to @stock
        else
          render 'edit'
        end
      end
    
      def index
        @stocks = Stock.paginate(page: params[:page], per_page: 5)
      end
    
      def show
        
      end
      
      def destroy
        @stock.destroy
        
        flash[:notice] = "This appointment was success destroy!"
        redirect_to appointments_path
      end
  
      private
    
      def set_stock
        @stock = Stock.find(params[:id])
      end
  
      def stock_params
        params.require(:stock).permit(:user_id, :content, :namedoctor)
      end

end