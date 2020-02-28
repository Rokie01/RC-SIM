classdef frequency_card
  properties
    stepping_type
    no_of_steps
    frequency
    step_increment
    blank = 0;  
  end
  methods
    function obj = frequency_card(val1, val2, val3, val4)
      obj.stepping_type   = val1;
      obj.no_of_steps     = val2;
      obj.frequency       = val3;
      obj.step_increment  = val4;
    end
  end
end
