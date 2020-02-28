classdef ground_card
  properties
    ground_type
    rad_wire_no
    dielectric_const
    conductivity
    blank = 0;

  end
  methods
    function obj = ground_card(val1, val2, val3, val4)
      obj.ground_type       = val1;
      obj.rad_wire_no       = val2;
      obj.dielectric_const  = val3;
      obj.conductivity      = val4;
    end
  end
end