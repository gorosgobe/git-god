class Range

  # Creates a new Range object.
  def initialize(lower, upper)
    @lower = lower
    @upper = upper
  end

  # Checks whether the given value is within the range.
  def within?(value)
    value >= @lower and value <= @upper
  end

  # Checks whether the range has the same lower and upper limit.
  def unique_val?
    @lower == @upper
  end

  # Returns the string representation of the range
  def to_s
    if self.unique_val?
      @lower.to_s
    else
      @lower.to_s + "-" + @upper.to_s
    end
  end

end