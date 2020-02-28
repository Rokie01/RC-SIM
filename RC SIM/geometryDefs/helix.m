% File:     wire.m
% Author:   Timothy Rokebrand
% Date:     28/11/2017

% The following is the class definiton for a wire element

classdef helix
  properties
    tag_no
    segments
    spacing
    total_length
    x_radius_start
    y_radius_start
    x_radius_end
    y_radius_end
    wire_radius
    voltage
    voltage_seg
  end
  methods
    function obj = helix(varargin)
      if nargin == 11
        obj.tag_no          = varargin{1};
        obj.segments        = varargin{2};
        obj.spacing         = varargin{3};
        obj.total_length    = varargin{4};
        obj.x_radius_start  = varargin{5};
        obj.y_radius_start  = varargin{6};
        obj.x_radius_end    = varargin{7};
        obj.y_radius_end    = varargin{8};
        obj.wire_radius     = varargin{9};
        obj.voltage         = varargin{10};
        obj.voltage_seg     = varargin{11};
      else
        obj.tag_no          = 0;
        obj.segments        = 0;
        obj.spacing         = 0;
        obj.total_length    = 0;
        obj.x_radius_start  = 0;
        obj.y_radius_start  = 0;
        obj.x_radius_end    = 0;
        obj.y_radius_end    = 0;
        obj.wire_radius     = 0;
        obj.voltage         = 0;
        obj.voltage_seg     = 0;
      end
    end
  end
end