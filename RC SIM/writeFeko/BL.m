function BL(fileName, antenna_elements);
  %target_file = fopen(fileName, 'at');
  formatSpec = 'BL: %s : %s \n';
  source_counter = 0;
  for i = 1:size(antenna_elements)(2)
    wire_start = ["P" num2str(2*i-1)];
    wire_end = ["P" num2str(2*i)];
    IP(fileName, antenna_elements(i));
    target_file = fopen(fileName, 'at');
    if (antenna_elements(i).voltage > 0)
      source_counter++;
      seg_start = ["S" num2str(2*source_counter-1)];
      seg_end = ["S" num2str(2*source_counter)];
      fprintf(target_file,formatSpec,wire_start,seg_start);
      fprintf(target_file,formatSpec,seg_end,wire_end); 
      %fprintf(target_file,'LA: 1 \n');    
      fprintf(target_file,formatSpec,seg_start,seg_end);	
      fclose(target_file);
    else
      fprintf(target_file,formatSpec,wire_start,wire_end);	
      fclose(target_file);
    end
  end
%  fprintf(target_file,'GE \n')

end
