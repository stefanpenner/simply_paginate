module SimplyPaginate
  VERSION = "0.0.1"
  autoload :Pagination,  'simply_paginate/pagination'
  autoload :PageNumbers, 'simply_paginate/page_numbers'
end

require 'simply_paginate/view_helpers'
require 'simply_paginate/controller_helpers'
