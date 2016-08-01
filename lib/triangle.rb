class TriangleError < StandardError

end


class Triangle
  

  attr_accessor :length1, :length2, :length3, :kind, :lengths

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
    @lengths = [@length1, @length2, @length3]
  end

  def kind
    if @lengths.all? {|length| length > 0} && !triangle_check
      if @lengths.uniq.size == 1
        :equilateral
      elsif @lengths.uniq.size == 2
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end

  end

  def triangle_check
    @length1 + @length2 <= @length3 || @length1 + @length3 <= @length2 || @length2 + @length3 <= @length1
  end
end


