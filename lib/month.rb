require_relative "zellers_congruence"

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def length
    length = 30 + (@month + (@month/8).floor) % 2
    if @month == 2
      Year.new(@year).leap? ? length -= 1 : length -= 2
    end
    length
  end

  def month_layout
    month_array = Array.new(6) {Array.new}
    month_array = week_array(month_array)
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    month_layout.each do |week|
      week.map! do |day|
        day == nil ? "  " : day.to_i < 10 ? " " + day.inspect : day
      end
      output << week.join(" ") + "\n"
    end
    output
  end

  private

  def week_array(arr)
    index = ZellersCongruence.calculate(@month, @year)
    day_count = 7 - index
    day_count.times do |i|
      arr[0].insert(index, i + 1)
      index += 1
    end
    day_count += 1
    5.times do |x|
      x += 1
      7.times do
        if day_count <= length
          arr[x].push(day_count)
          day_count += 1
        else
          arr[x].push(nil)
        end
      end
    end
    arr
  end
end
