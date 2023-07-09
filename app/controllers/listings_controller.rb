# class ListingsController < ApplicationController

#   def create
#     landlord = current_landlord 

#     # Extract the parameters from the request
#     listingType = params[:listingType]
#     town = params[:town]
#     name = params[:name]
#     listingStatus = params[:listingStatus]
#     priceFrom = params[:priceFrom]
#     priceUpTo = params[:priceUpTo] 
#     bedrooms = params[:bedrooms] 
#     bathrooms = params[:bathrooms] 
#     images_data = params[:images] # Assuming images is an array
#     # images = params[:images] # Assuming image is a file upload

#     # Extract the url and name properties from each image object
#     images = images_data.map { |image| { url: image['url'], name: image['name'] } }

#     # Create a new Compose record with the extracted parameters
#     listing = Listing.create(
#       listingType: listingType,
#       town: town,
#       name: name,
#       listingStatus: listingStatus,
#       priceFrom: priceFrom,
#       priceUpTo: priceUpTo,
#       bedrooms: bedrooms,
#       bathrooms: bathrooms,
#       images: images
#     )

#     if listing.valid?
#       render json: { success: true, message: "Listing created successfully" }
#     else
#       render json: { success: false, errors: listing.errors.full_messages }
#     end
#   end

#   def index
#     landlord = current_landlord
#     listings = landlord.listings
#     render json: listings
#   end

#   def destroy
#     listing = Listing.find_by(id: params[:id])

#       if listing
#         listing.destroy
#           head :no_content
#       else
#           render json: {error: "Listing not found"}, status: :not_found
#       end
#   end
    
#   def show
#     listing = Listing.find_by(id: params[:id])
#       if listing
#           render json: listing
#       else
#           render json: {error: "Listing not found"}, status: :not_found
#       end
#   end
# end

class ListingsController < ApplicationController
  before_action :current_landlord
  before_action :set_listing, only: [:show, :update, :destroy]
  # skip_before_action :current_landlord, only: [:create]

  def create
    listing = current_landlord.listings.create(listing_params)

    if listing.save
      render json: listing, status: :created
    else
      render json: { error: listing.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end
  
  def index
    listings = Listing.all
    render json: listings
  end

  def show
    render json: @listing
  end

  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: { error: @listing.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    render json: { message: 'Listing deleted successfully' }
  end

  private

  def listing_params
    params.require(:listing).permit(:listingType, :town, :name, :listingStatus, :priceFrom, :priceUpTo, :bedrooms, :bathrooms, images: [:url, :name])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Listing not found' }, status: :not_found
  end

end
