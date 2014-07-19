class ZellersCongruence

  def self.calculate(m, y)

    if m == 1 || m == 2
      m += 12
      y -= 1
    end

    day = (1 + (((m + 1) * 26) / 10).floor + y + (y/4).floor + 6 * (y/100).floor + (y/400).floor).modulo(7)

    case day
      when 0 then 6
      when 1 then 0
      when 2 then 1
      when 3 then 2
      when 4 then 3
      when 5 then 4
      else 5
    end
  end
end
