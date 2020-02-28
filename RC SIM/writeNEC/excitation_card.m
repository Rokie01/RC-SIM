classdef excitation_card
  properties
    excitation_type
    tag_no
    segment_no
    voltage
    blank = 0;

  end
  methods
    function obj = excitation_card(val1, val2, val3, val4)
      obj.excitation_type = val1;
      obj.tag_no          = val2;
      obj.segment_no      = val3;
      obj.voltage         = val4;
    end
  end
end