module ApplicationHelper
  def display_number number
    case number
    when Float
      return number.to_s.gsub(".0", "")
    else
      return number.to_s
    end
  end

  def display_nth number
    case number
    when 1
      return "1st"
    when 2
      return "2nd"
    when 3
      return "3rd"
    else 4..10
      return "#{number}th"
    end
  end
end
