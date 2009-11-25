require 'rubygems'
require_gem 'rspec'

context 'Array of mixed numbers' do
  setup do
    @even_numbers = [2,4,8]
    @odd_numbers = [1,3,7]
    #@mixed_numbers = @odd_numbers + @even_numbers + @odd_numbers
  end

  specify 'should return even numbers as an array' do
    # @mixed_numbers.even_numbers.should.equal @even_numbers
    @even_numbers.should.equal @evan_numbers
  end
end
