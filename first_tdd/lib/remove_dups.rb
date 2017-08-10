require 'byebug'
class Array
  def my_uniq
    self.uniq
  end

  def two_sum
    result = []
    count.times do |i1|
      (i1 + 1...length).to_a.each do |i2|
        result << [i1, i2] if (self[i1] + self[i2]) == 0
      end
    end
    result
  end

  def my_transpose
    self.transpose
  end

  def stockpicker
    results = []
    profit = 0
    count.times do |i1|
      (i1 + 1..length - 1 ).each do |i2|
        newprofit = self[i2] - self[i1]
        if newprofit > profit
          results = [i1,i2]
        end
      end 
    end
    results
  end

end
