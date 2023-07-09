class TenantsController < ApplicationController
  before_action :current_landlord
  before_action :set_tenant, only: [:show, :update, :destroy]
  
  # GET /tenants
  def index
    tenants = Tenant.all
    render json: tenants
  end

  # POST /tenants
  def create
    # Output the tenant_params for debugging
    puts tenant_params.inspect
    
    # Log the current_landlord for debugging
    Rails.logger.debug("Current Landlord: #{current_landlord.inspect}")
  

    tenant = current_landlord.tenants.create(tenant_params)

    if tenant.save
      render json: tenant, status: :created
    else
      Rails.logger.debug("Tenant Errors: #{tenant.errors.full_messages.join(', ')}")
      render json: { error: tenant.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  # GET /tenants/:id
  def show
    render json: @tenant
  end

  # PATCH /tenants/:id
  def update
    if @tenant.update(tenant_params)
      render json: @tenant
      # render json: { message: 'Tenant data updated successfully' }, status: :ok
    else
      # render json: { error: @tenant.errors.full_messages.join(', ') }, status: :unprocessable_entity
      render :edit
    end
  end

  # DELETE /tenants/:id
  def destroy
    @tenant.destroy
    head :no_content
    # render json: { message: 'Tenant deleted successfully' }
  end
  
  private

  def set_tenant
    @tenant = Tenant.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Tenant not found' }, status: :not_found
  end

  def tenant_params
    params.require(:tenant).permit(:fullname, :dob, :gender, :Krapin, :nationality, :phonenumber, :emailaddress, :currentaddress, :emergencycontact, :idtype, :idnumber, :idexpirydate, :employer, :jobtitle, :monthlyincome, :personalreference, :previouslandlord, :leasestartdate, :leaseenddate, :rentamount, :securitydeposit, :listing_id, :propertyname, :additionalnotes, idattachment: [:url, :name])
  end
  
end
  
