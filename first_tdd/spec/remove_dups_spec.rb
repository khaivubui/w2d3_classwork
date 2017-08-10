require 'remove_dups'

describe 'Array' do

  describe '#my_uniq' do
    subject(:array) { [1, 2, 1, 3, 3] }
    it 'removes duplicates' do
      expect(array.my_uniq).not_to eq(array)
    end
  end

  describe '#two_sum' do
    subject(:array) { [-1, 0, 2, -2, 1] }
    it 'returns indexes of elements whose sum is zero' do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    subject(:array) do [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]]
    end
    it 'transposes the matrix' do
      expect(array.my_transpose).to eq([[0, 3, 6],
                                        [1, 4, 7],
                                        [2, 5, 8]])
    end
  end

  describe 'stockpicker' do
    subject(:array) {[5,6,3,2,8]}
    it 'chooses the most profitable combo' do
      expect(array.stockpicker).to eq([3,4])
    end
  end
end
