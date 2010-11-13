require 'action_controller'
module SimplyPaginate::ControllerHelpers
  def paginate(collection, *options)
    SimplePaginate::Pagination.new(collection,*options)
  end
end

ActionController::Base.send :include,SimplyPaginate::ControllerHelpers
