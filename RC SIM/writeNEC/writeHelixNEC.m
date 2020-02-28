function writeHelixNEC(fileName, antenna_elements);
  target_file = fopen(fileName, 'at');
  fclose(fileName);
  formatSpec = 'GH \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  
  for i = 1:size(antenna_elements)(2)
    fprintf(target_file,formatSpec,antenna_elements(i).tag_no,...
    antenna_elements(i).segments, antenna_elements(i).spacing,...
    antenna_elements(i).total_length, antenna_elements(i).x_radius_start,...
    antenna_elements(i).y_radius_start, antenna_elements(i).x_radius_end,...
    antenna_elements(i).y_radius_end, antenna_elements(i).wire_radius);
  end
  %fprintf(target_file,'GE \n');
  fclose(target_file);
end