require 'action_controller'
module SimplyPaginate
  module ControllerHelpers
    def paginate(collection, *options)
      Pagination.new(collection,*options)
    end
  end
end

ActionController::Base.send :include, SimplyPaginate::ControllerHelpers
