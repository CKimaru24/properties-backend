class Tenant < ApplicationRecord
    # alias_attribute :fullName, :full_name
    belongs_to :landlord
    belongs_to :listing
    # mount_uploader :idattachment, IdattachmentUploader
  end
  
