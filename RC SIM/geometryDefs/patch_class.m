% File:     patch.m
% Author:   Timothy Rokebrand
% Date:     04/07/2018

% The following is the class definiton for a patch element

classdef patch_class
  properties
    patch_shape
    %for arbitrary shape defined by NEC coordinates refer to centre
    x_coordinates
    y_coordinates
    z_coordinates
    elevation_angle
    azimuth_angle
    patch_area

  end
  methods
    function obj = patch_class(varargin)
      if nargin == 4
        obj.patch_shape     = varargin{1};
        obj.x_coordinates   = varargin{2};
        obj.y_coordinates   = varargin{3};
        obj.z_coordinates   = varargin{4};
        obj.elevation_angle = 0;
        obj.azimuth_angle   = 0;
        obj.patch_area      = 0;
      end
    end
  end
end