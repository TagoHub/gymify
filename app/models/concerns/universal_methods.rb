module UniversalMethods
  extend ActiveSupport::Concern

  included do
    # optional hooks, e.g., before_save
  end

  def get_load load, from_unit, to_unit
    return 0.0 if load.zero?
    from = from_unit.abbreviation
    to = to_unit.abbreviation
    case from
    when 'Kgs'
      if to == 'Lbs'
        (load * 2.20462).round(2)
      end
    when 'Lbs'
      if to == 'Kgs'
        (load / 2.20462).round(2)
      end
    else
      load
    end
  end
end