class InboxsController < ApplicationController
    def create
    inbox = Inbox.new(inbox_params)
  
      if inbox.save
        render json: inbox, status: :created
      else
        render json: { error: inbox.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @inbox
    end
  
    def index
      inboxs = Draft.all
      render json: inboxs, status: :ok
    end

    def destroy
        inbox = Inbox.find_by(id: params[:id])

        if inbox
            inbox.destroy
            head :no_content
        else
            render json: {error: "Inbox not found"}, status: :not_found
        end
    end
  
    private
  
    def inbox_params
      params.require(:inbox).permit(:email, :cc, :bcc, :subject, :message, attachments: [])
    end
  end
  