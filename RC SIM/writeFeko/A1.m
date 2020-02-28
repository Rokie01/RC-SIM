function A1(fileName, element);
  target_file = fopen(fileName, 'at');
%  x = element.x_begin;
%  a = element.voltage_seg;
%  n = element.segments;
  formatSpec = 'A1: %5d : %5d : %s : %s : %s : %5d : %5d : %5d : %5d : %5d \n';
        x = element.x_begin + (((element.x_end - element.x_begin)/(element.segments)) * (element.voltage_seg - 0.5));
        y = element.y_begin + (((element.y_end - element.y_begin)/(element.segments)) * (element.voltage_seg - 0.5));
        z = element.z_begin + (((element.z_end - element.z_begin)/(element.segments)) * (element.voltage_seg - 0.5));
      
    fprintf(target_file,formatSpec,0,-1,'','','',element.voltage,0,x,y,z);

%  fprintf(target_file,'GE \n')
  fclose(target_file);
end
