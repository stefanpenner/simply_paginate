require 'action_view'
module SimplyPaginate::ViewHelpers
  def pagination(collection)
    links = []
    pages = collection.count/50
    links << link_to("« Previous",dashboard_url)
    (pages).times do |page|
      page+=1
      links << link_to(page,"/leads?page=#{page}")
    end
    links << link_to("Next »")
    links.join.html_safe
  end
end
ActionView::Base.send :include, SimplyPaginate::ViewHelpers
