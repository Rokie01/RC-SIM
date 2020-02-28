function EG(fileName);
  target_file = fopen(fileName, 'at');  
  formatSpec = 'EG: %5d : %5d : %5d :  :  :  :  :  :  :  :  :  : %5d \n\n';
  fprintf(target_file,formatSpec,0,0,0,1);
  fclose(target_file);
end