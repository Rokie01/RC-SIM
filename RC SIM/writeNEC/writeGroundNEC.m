%Author: Timothy Rokebrand
%The purpose of this file is to write the ground information to a NEC file

function writeGroundNEC(fileName, GN);
  target_file = fopen(fileName, 'at');
  formatSpec = 'GN \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  for(i = 1:size(GN)(2))
    fprintf(target_file,formatSpec,GN(i).ground_type,GN(i).rad_wire_no,... 
    GN(i).blank, GN(i).blank, GN(i).dielectric_const, GN(i).conductivity,...
    GN(i).blank, GN(i).blank, GN(i).blank, GN(i).blank);
  end
  %fprintf(target_file,'XQ')
  fclose(target_file);
end