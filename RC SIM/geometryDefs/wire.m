% File:     wire.m
% Author:   Timothy Rokebrand
% Date:     28/11/2017

% The following is the class definiton for a wire element

classdef wire
  properties
    tag_no
    segments
    x_begin
    x_end
    y_begin
    y_end
    z_begin
    z_end
    wire_radius
    voltage
    voltage_seg
  end
  methods
    function obj = wire(varargin)
      if nargin == 11
        obj.tag_no      = varargin{1};
        obj.segments    = varargin{2};
        obj.x_begin     = varargin{3};
        obj.y_begin     = varargin{4};
        obj.z_begin     = varargin{5};
        obj.x_end       = varargin{6};
        obj.y_end       = varargin{7};
        obj.z_end       = varargin{8};
        obj.wire_radius = varargin{9};
        obj.voltage     = varargin{10};
        obj.voltage_seg = varargin{11};
      else
        obj.tag_no      = 0;
        obj.segments    = 0;
        obj.x_begin     = 0;
        obj.y_begin     = 0;
        obj.z_begin     = 0;
        obj.x_end       = 0;
        obj.y_end       = 0;
        obj.z_end       = 0;
        obj.wire_radius = 0;
        obj.voltage     = 0;
        obj.voltage_seg = 0;
      end
    end
  end
end