class StocksController < ApplicationController
    

    
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
                    flash.now[:alert] = "Please enter a valid name"
                    format.js { render partial: 'users/result' }
                end
             end
        else
            respond_to do |format|
                flash.now[:alert] = "Please enter a name "
                format.js { render partial: 'users/result' }
            end
        end
    end
    def new    
        @stock = Stock.new
      end
    
      def create
        @stock = Stock.new(stock_params)
        if @stock.save 
          flash[:notice] = "Рекомендация создана, выпишите пациенту рецепт!"
            render 'edit'
        else
          render 'new'
        end
      end
    
      def edit
        
      end
    
      def update
        if @stock.update(stock_param)
            @stock.namedoctor = current_doctor.name
            @appointment = Appointment.find(@stock.appointment_id)           
            @appointment.stock_id = @stock.id
            @appointment.save
            @stock.save
          flash[:notice] = "Запись сохранена!"
          redirect_to current_doctor
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
        
        flash[:notice] = "Запись удалена!"
        redirect_to stocks_path
      end
  
      private
    
      def set_stock
        @stock = Stock.find(params[:id])
      end
  
      def stock_params
        params.permit(:user_id, :content, :namedoctor, :appointment_id)
      end
      def stock_param
        params.require(:stock).permit( :content, :namedoctor, :id)
      end

end