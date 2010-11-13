require 'spec_helper'

describe SimplyPaginate::PageNumbers do
  describe "setup and stuff" do
    before(:each) do
      @count = 20
      @index = 1
      @page_numbers =  SimplyPaginate::PageNumbers.new(@count,@index)
    end

    it "has correct count" do
      @page_numbers.count.should == 20 
    end

    it "has correct index" do
      @page_numbers.index = 1
    end

    it "has correct number list" do
      @page_numbers.number_list == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    end
  end

  def self.correct_sparse_list(index,count,result)
    describe "sparse number list: index #{index}, page_count #{count}" do
      before(:each) do
        @count = count
        @index = index
        @page_numbers =  SimplyPaginate::PageNumbers.new(@count,@index)
      end

      it "hash correct sparse number list" do
        @page_numbers.sparse_number_list.should == result
      end
    end
  end

  #                  (count,index,expected_output)
  correct_sparse_list(0,    0,    [])
  correct_sparse_list(1,    5,    [1,2,3,4,5])
  correct_sparse_list(5,    5,    [1,2,3,4,5])
  correct_sparse_list(1,    10,   [1,2,3,4,5,6,7,8,9,10])
  correct_sparse_list(10,   10,   [1,2,3,4,5,6,7,8,9,10])
  correct_sparse_list(10,   20,   [1,2,'...',7,8,9,10,11,12,13,'...',19,20])
  correct_sparse_list(7,    20,   [1,2,'...',4,5,6,7,8,9,10,'...',19,20])
  correct_sparse_list(5,    20,   [1,2,3,4,5,6,7,8,'...',19,20])
end
