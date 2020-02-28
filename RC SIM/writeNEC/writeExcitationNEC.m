%Author: Timothy Rokebrand
%The purpose of this file is to write the excitation information to a NEC file

function writeExcitationNEC(fileName, EX);
  target_file = fopen(fileName, 'at');
  formatSpec = 'EX \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  for(i = 1:size(EX)(2))
    fprintf(target_file,formatSpec,EX(i).excitation_type,EX(i).tag_no, EX(i).segment_no,...
    EX(i).blank, EX(i).voltage);
  end
  %fprintf(target_file,'XQ')
  fclose(target_file);
end