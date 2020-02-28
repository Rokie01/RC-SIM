function TITLE(fileName);
  target_file = fopen(fileName, 'at');  
  formatSpec = '** Date and time created: %5s \n\n';
  fprintf(target_file,formatSpec,ctime(time()));
  fclose(target_file);
end