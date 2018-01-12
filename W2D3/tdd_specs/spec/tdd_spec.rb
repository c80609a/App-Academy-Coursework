require 'rspec'
require 'tdd'


describe "my_uniq" do
  let(:orig_array) { [1, 2, 3, 1, 2, 3] }
  let(:uniq_array) { my_uniq(orig_array.dup) }

  it 'does not modify original array' do
    expect { my_uniq(orig_array) }.to_not (change { orig_array })
  end

  it 'removes the duplicate elements from an array' do
    orig_array.each do |el|
      expect(uniq_array.count(el)).to eq(1)
    end
  end

  it 'only contains items from the original array' do
    uniq_array.each do |el|
      expect(orig_array).to include(el)
    end
  end
end

describe 'two-sum' do
  let(:array) { [2, -2, 1, 0, -1] }
  let(:zeros_arr) { [0, 0, 2, -1] }
  it 'does not modify the original array' do
    expect { two_sum(array) }.to_not (change { array })
  end

  it 'correctly returns the indexes of pairs that add to zero' do
    expect(two_sum(array)).to eq([[0, 1], [2, 4]])
  end


  it 'returns an empty array if there are no index pairs that add to zero' do
    expect(two_sum([1, 2])).to eq([])
  end

  it 'correctly handles arrays that have zeros' do
    expect(two_sum(zeros_arr)).to eq([])
  end
end

describe 'my_transpose' do
  let(:orig_matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it 'correctly transposes each row' do
    expect(my_transpose(orig_matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

end
