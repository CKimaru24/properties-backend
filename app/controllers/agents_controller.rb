class AgentsController < ApplicationController
    before_action :current_landlord
    before_action :set_agent, only: [:show, :update, :destroy]
    
    # GET /agents
    def index
        agents = Agent.all
        render json: agents
    end
      
    # POST /agent
    def create
    # Output the agent_params for debugging
    puts agent_params.inspect
    
    # Log the current_landlord for debugging
    Rails.logger.debug("Current Landlord: #{current_landlord.inspect}")


    agent = current_landlord.agents.create(agent_params)

    if agent.save
      render json: agent, status: :created
    else
      Rails.logger.debug("Agent Errors: #{agent.errors.full_messages.join(', ')}")
      render json: { error: agent.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
    end

    # GET /agents/:id
    def show
      render json: @agent
    end
      
    # PATCH /agents/:id
    def update
      if @agent.update(agent_params)
        render json: @agent, status: :ok
        # render json: { message: 'Agent data updated successfully' }, status: :ok
      else
        # render json: { error: @agent.errors.full_messages.join(', ') }, status: :unprocessable_entity
        render :edit
      end
    end
      
    # DELETE /agents/:id
    def destroy
      @agent.destroy
      head :no_content
      # render json: { message: 'Agent deleted successfully' }
    end
      
    private
      
    def set_agent
      @agent = Agent.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Agent not found' }, status: :not_found
    end
    
    def agent_params
        params.require(:agent).permit(:fullname, :dob, :gender, :phonenumber, :emailaddress, :address, :city, :country, :workhistory, :certifications, :education, :marketingexperience, :onlinemarketing, :socialmediapromotion, :communicationskills, :interpersonalskills, :marketingknowledge, :technologyskills, :workinghours, :additionalcomments, :agreement)
    end
end
