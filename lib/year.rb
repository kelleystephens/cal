require_relative "month"

class Year
  # include Comparable

  def initialize(year)
    @year = year
  end

  def year_header
    "#{@year}".center(62).rstrip
  end

  def month_header(months)
    months.each do |m|
      month = Month.new(m, @year)
      name = month.name
      if m % 3 != 0
        name = name.center(20) + "  "
        @yr << name
      else
        spaces = (20 - name.size) / 2
        name = " " * spaces + name + "\n"
        @yr << name
      end
      @yr
    end
  end

  def week_days
    week_days = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
  end

  def days(index, nums)
    line = ""
    m = [Month.new(nums[0], @year), Month.new(nums[1], @year), Month.new(nums[2], @year)]
    m.each do |mth|
      arr = mth.month_layout
      arr = arr[index].map do |i|
        if i == nil
          i = "\s\s"
        elsif i.to_i < 10
          i = " #{i}"
        else
          i
        end
        i
      end
      arr = arr.join(" ")
      line << arr << "  "
    end
    line = line.rstrip
    line << "\n"
    line
  end

  def to_s
    @yr = year_header << "\n\n"
    a = 1
    4.times do
      x = 0
      month_header([a, a + 1, a + 2])
      @yr << week_days
      6.times do
        d = days(x, [a, a + 1, a + 2])
        x += 1
        @yr << d
      end
      a += 3
    end
    @yr
  end
end
