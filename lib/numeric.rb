class Numeric

  def days
    o = Object.new
    o.instance_variable_set("@time", Time.now)
    o.instance_variable_set("@diff", self * 3600 * 24)

    def o.ago
      @time - @diff
    end

    def o.from_now
      @time + @diff
    end

    return o
  end

end

puts Time.now
puts 5.days.ago
puts 5.days.from_now
