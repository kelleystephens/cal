require_relative "zellers_congruence"

class Month
  include Comparable

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def <=>(other)
    self <=> other
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
      if (@year % 4 == 0) && (@year % 100 != 0) || (@year % 400 == 0)
        length -= 1
      else
        length -= 2
      end
    end
    length
  end

  def month_layout
    month_array = [[], [], [], [], [], []]
    month_array = week_array(month_array)
    month_array
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    month_layout.each do |week|
      week.map! do |day|
        if day == nil
          day = "  "
        else
          day < 10 ? " " + day.inspect : day
        end
      end
      week = week.join(" ")
      output << week + "\n"
    end
    output
  end

  private

  def week_array(arr)
    d = 1
    index = ZellersCongruence.calculate(@month, @year)
    x = 7 - index
    x.times do
      arr[0].insert(index, d)
      index += 1
      d +=1
    end
    num = 1
    5.times do
      7.times do
        if d <= length
          arr[num].push(d)
          d += 1
        else
          arr[num].push(nil)
        end
      end
      num += 1
    end
    # 7.times do
    #   arr[1].push(d)
    #   d += 1
    # end
    # 7.times do
    #   arr[2].push(d)
    #   d += 1
    # end
    # 7.times do
    #   if d <= length
    #     arr[3].push(d)
    #     d += 1
    #   else
    #     arr[3].push(nil)
    #   end
    # end
    # 7.times do
    #   if d <= length
    #     arr[4].push(d)
    #     d += 1
    #   else
    #     arr[4].push(nil)
    #   end
    # end
    # 7.times do
    #   if d <= length
    #     arr[5].push(d)
    #     d += 1
    #   else
    #     arr[5].push(nil)
    #   end
    # end
    arr
  end
end
