require_relative "month"

class Year

  def initialize(year)
    @year = year
  end

  def year_header
    "#{@year}".center(62).rstrip
  end

  def leap?
   (@year % 4 == 0) && (@year % 100 != 0) || (@year % 400 == 0)
  end

  def month_header(num)
    case num
      when 0 then "      January               February               March\n"
      when 1 then "       April                  May                   June\n"
      when 2 then "        July                 August              September\n"
      else "      October               November              December\n"
    end
  end

  def week_days
    "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
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
    4.times do |x|
      @yr << month_header(x)
      @yr << week_days
      6.times do |i|
        d = days(i, [a, a + 1, a + 2])
        @yr << d
      end
      a += 3
    end
    @yr
  end
end
