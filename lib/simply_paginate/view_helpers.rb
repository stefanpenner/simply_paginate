# -*- encoding: utf-8 -*-
require 'action_view'
module SimplyPaginate
  module ViewHelpers
    def pagination(collection)
      links = []
      total_pages  = collection.count/50
      current_page = params[:page]

      links << "<div class='paginate'>"
      links << link_to("« Previous",dashboard_url)

      numbers = SimplyPaginate::PageNumbers.new(total_pages,current_page)

      numbers.sparse_number_list.each do |number|
        link_params = params.merge({:page => number}).to_param
        links << link_to(number,"#{request.path}?#{link_params}")
      end

      links << link_to("Next »")
      links << "</div>"
      links.join.html_safe
    end
  end
end

ActionView::Base.send :include, SimplyPaginate::ViewHelpers
