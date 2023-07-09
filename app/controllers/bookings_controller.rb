class BookingsController < ApplicationController
    def create
        # Extract the parameters from the request
        name = params[:name]
        email = params[:email]
        phone = params[:phone]
        message = params[:message]
        
    
        # Create a new Compose record with the extracted parameters
        booking = Booking.create(
          name: name,
          email: email,
          phone: phone,
          message: message
        )
    
        if booking.valid?
          render json: { success: true, message: "Booking created successfully" }
        else
          render json: { success: false, errors: booking.errors.full_messages }
        end
      end
        
      def index
        bookings = Booking.all
          render json: bookings, status: :ok
      end
    
      def destroy
        booking = Booking.find_by(id: params[:id])
    
          if booking
            booking.destroy
              head :no_content
          else
              render json: {error: "Booking not found"}, status: :not_found
          end
      end
        
      def show
        booking = Booking.find_by(id: params[:id])
          if booking
              render json: booking
          else
              render json: {error: "Booking not found"}, status: :not_found
          end
      end
end
