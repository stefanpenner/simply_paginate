module SimplyPaginate
  class PageNumbers 

    attr_accessor :count, :index

    def initialize(count,index)
      @count = count  || 0
      @index = index.try(:to_i) || 1
      @index = 1 if @index < 1 
    end

    def sparse_number_list
      if count <= 10
        (1..count).to_a
      else
        range = (1..count).to_a
        beginning = range[0...2]
        middle    = range[(index-4)..(index+2)]
        ending    = range[-2..-1]
        list = (beginning + middle + ending).uniq
        list.inject([]) do |array, number|
          if number > (array.last || 0) + 1
            array << '...'
          end
          array << number
        end
      end
      # Single loop, add '...' if there is a gap (can't use uniq, will kill two '...'s)
    end

    def number_list
      (1..@count).to_a
    end
  end
end
