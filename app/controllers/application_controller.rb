class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format == Mime[:json] }
  
    # Before processing, set the request formats in current controller formats.
    def process_action(*)
      self.formats = request.formats&.filter_map(&:ref)
      super
    end
  end
  
