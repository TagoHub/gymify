module ApplicationHelper
  def display_number number
    case number
    when Float
      return number.to_s.gsub(".0", "")
    else
      return number.to_s
    end
  end
end
