%Author: Timothy Rokebrand
%The purpose of this file is to write the geometry information to a NEC file

function writeGeometryNEC(fileName, antenna_elements);
  target_file = fopen(fileName, 'at');
  formatSpec = 'GW \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  
  for i = 1:size(antenna_elements)(2)
    fprintf(target_file,formatSpec,antenna_elements(i).tag_no,...
    antenna_elements(i).segments, antenna_elements(i).x_begin,...
    antenna_elements(i).y_begin, antenna_elements(i).z_begin,...
    antenna_elements(i).x_end, antenna_elements(i).y_end,...
    antenna_elements(i).z_end, antenna_elements(i).wire_radius);
  end
%  fprintf(target_file,'GE \n')
  fclose(target_file);
end