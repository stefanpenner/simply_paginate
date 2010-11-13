require 'active_support/core_ext/module/delegation'
module SimplyPaginate
  class Pagination
    include Enumerable
    attr_accessor :collection, :page, :offset, :count
    delegate :each, :to => :collection

    def initialize(collection,*options)
      options = options.extract_options!
      options.reverse_merge!({
        :page => 1,
        :per_page => 25,
      })

      @count      = collection.count
      @collection = collection.paginate(options[:page],options)
      @page       = page
      @offset     = offset
    end
  end
end

