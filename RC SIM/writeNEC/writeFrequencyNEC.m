%Author: Timothy Rokebrand
%The purpose of this file is to write the frequency information to a NEC file

function writeFrequencyNEC(fileName, FR);
  target_file = fopen(fileName, 'at');
  formatSpec = 'FR \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  fprintf(target_file,formatSpec,FR.stepping_type,FR.no_of_steps, FR.blank,...
  FR.blank, FR.frequency, FR.step_increment);

  fclose(target_file);
end