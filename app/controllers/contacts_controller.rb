class ContactsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        contacts = Contact.all
        render json: contacts, status: :ok
    end

    # POST /contacts
    def create
      contact = Contact.create!(contact_params)
      render json: contact, status: :created
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end

    def render_not_found_response
        render json: {error: "Contact not found"}, status: :render_not_found_response
    end

    def render_unprocessable_entity_response (invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :render_unprocessable_entity_response
    end
end
  