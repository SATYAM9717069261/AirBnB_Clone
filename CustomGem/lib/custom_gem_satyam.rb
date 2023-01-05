class Array
  def split_odd_even
    partition(&:even?)
  end
end
