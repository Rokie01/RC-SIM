function FF(fileName, settings);
  target_file = fopen(fileName, 'at');  
  formatSpec = 'FF: %5d : %5d : %5d : %5d : %5d : %5d : %5d : %5d : %5d :  :  :  : %5d \n';
  fprintf(target_file,formatSpec,1,settings.rad_phi_steps,settings.rad_theta_steps,0,0,settings.rad_phi_start,settings.rad_theta_start,settings.rad_resolution,settings.rad_resolution,0);
  fclose(target_file);
end