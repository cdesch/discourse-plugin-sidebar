module SidebarConcern
	extend ActiveSupport::Concern

  included do |base|
    before_action :sidebar
  end

	def sidebar
    if !request.xhr? && current_user
      @sidebar ||= SidebarBox.new(params[:controller], params[:action])
    end
	end
end