class ComposesController < ApplicationController
    def create
      # Extract the parameters from the request
      email = params[:email]
      cc = params[:cc]
      bcc = params[:bcc]
      subject = params[:subject]
      message = params[:message]
      attachments = params[:attachments] # Assuming attachment is a file upload
  
      # Create a new Compose record with the extracted parameters
      compose = Compose.create(
        email: email,
        cc: cc,
        bcc: bcc,
        subject: subject,
        message: message,
        attachments: attachments
      )
  
      if compose.valid?
        render json: { success: true, message: "Compose created successfully" }
      else
        render json: { success: false, errors: compose.errors.full_messages }
      end
    end

    def index
        composes = Compose.all
        render json: composes, status: :ok
    end

    def destroy
        compose = Compose.find_by(id: params[:id])

        if compose
            compose.destroy
            head :no_content
        else
            render json: {error: "Compose not found"}, status: :not_found
        end
    end

    def show
        compose = Compose.find_by(id: params[:id])
        if compose
            render json: compose
        else
            render json: {error: "Compose not found"}, status: :not_found
        end
    end
  end
  
