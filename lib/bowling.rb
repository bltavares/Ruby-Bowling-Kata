module Bowling
  class Game 

  def score(pins)
    if (1..3).include? pins.size
      pins.inject(&:+)
    else
      if strike?(pins)
        score_strike(pins) + score_rest_of({:pins => pins, :less => 1 })
      elsif spare?(pins)
        score_spare(pins) + score_rest_of({:pins => pins, :less => 2 })
      else
        pins[0] + pins[1] + score_rest_of({:pins => pins, :less => 2 })
      end
    end
  end
  
  def score_rest_of(args)
    score(args[:pins].drop args[:less])
  end

  def score_strike(pins)
    10 + pins[1] + pins[2]
  end

  def spare?(pins)
    pins[0] + pins[1] == 10
  end
  
  def strike?(pins)
    pins[0] == 10
  end

  def score_spare(pins)
    10 + pins[2]
  end
end
end
