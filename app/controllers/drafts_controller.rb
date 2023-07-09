class DraftsController < ApplicationController
    # before_action :set_draft, only: [:show, :destroy]
  
    def create
      draft = Draft.new(draft_params)
  
      if draft.save
        render json: draft, status: :created
      else
        render json: { error: draft.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @draft
    end
  
    def index
      drafts = Draft.all
      render json: drafts, status: :ok
    end

    def destroy
        draft = Draft.find_by(id: params[:id])

        if draft
            draft.destroy
            head :no_content
        else
            render json: {error: "Draft not found"}, status: :not_found
        end
    end
  
    private
  
    # def set_draft
    #   @draft = Draft.find(params[:id])
    # end
  
    def draft_params
      params.require(:draft).permit(:email, :cc, :bcc, :subject, :message, attachments: [])
    end
  end
  