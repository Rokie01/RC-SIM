% File:     yagi.m
% Author:   Timothy Rokebrand
% Date:     05/12/2017

% The following defines yagi antennas based on different user defined properties

function elements = yagi(varargin)
    current_elements = varargin{1};
    no_of_elements = varargin{2};
    driven_length = varargin{3};
    reflector_length = varargin{4};
    director_length = varargin{5};
    driven_reflector_spacing = varargin{6};
    driven_director_spacing = varargin{7};
    director_spacing = varargin{8};
    element_radius = varargin{9};
    no_of_segments = varargin{10};
    voltage = varargin{11};
    voltage_segment = varargin{12};
    
    counter = 1;
    %driven element creation
    elements(counter) = wire(current_elements + counter, no_of_segments, -(driven_length/2),0,0,driven_length/2,...
      0,0, element_radius,voltage,voltage_segment);
    counter = counter + 1;
      
    %reflector creation
    elements(counter) = wire(current_elements + counter, no_of_segments, -(reflector_length/2),-driven_reflector_spacing,...
    0,reflector_length/2, -driven_reflector_spacing, 0, element_radius,0,0);
    counter = counter + 1;
      
    %director creation
    elements(counter) = wire(current_elements + counter, no_of_segments, -(director_length/2), driven_director_spacing,...
                        0,director_length/2, driven_director_spacing, 0, element_radius,0,0);
    counter = counter + 1;   
    j = 1;
    for(i=counter:no_of_elements)  
    spacing = (director_spacing*j) + driven_director_spacing;
    elements(i) = wire(current_elements + i, no_of_segments, -(director_length/2),...
                  spacing, 0, director_length/2, spacing, 0, element_radius,0,0);  
    j = j+1;
    end 
end