module SimplyPaginate
  class PageNumbers 

    attr_accessor :count, :index

    def initialize(count,index)
      @count = count  || 0
      @index = index  || 0
    end

    def sparse_number_list
      return [] if count == 0 or index == 0
      return number_list if count <= 10

      result = []
     
      result[count-1] = count
      result[count-2] = count-1

      result[index+2] = index+3
      result[index+1] = index+2
      result[index]   = index+1

      result[index-1] = index 

      result[index-2] = index-1 if index-2 > -1
      result[index-3] = index-2 if index-3 > -1
      result[index-4] = index-3 if index-4 > -1
      
      result[1] = 2
      result[0] = 1

      result.collect! { |value| value.nil? ? '...' : value }

      part1 = result[0...index].uniq
      part2 = result[index...count].uniq
      
      part1 += part2
    end

    def number_list
      (1..@count).to_a
    end
  end
end
