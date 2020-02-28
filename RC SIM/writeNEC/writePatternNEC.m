%Author: Timothy Rokebrand
%The purpose of this file is to write the radiatiation plot information to a NEC file

function writePatternNEC(varargin)
  target_file = fopen("input.nec", 'at');
  formatSpec = 'RP \t %5d \t %5d \t %5d \t %d%d%d%d \t %5d \t %5d \t %5d \t %5d \t %5d \t %5d \n';
  fprintf(target_file,formatSpec,0,varargin{1}.rad_phi_steps,varargin{1}.rad_theta_steps,...
  1,0,0,0,varargin{1}.rad_phi_start,varargin{1}.rad_theta_start,varargin{1}.rad_resolution,...
  varargin{1}.rad_resolution,0,0);
  fprintf(target_file,'EN')
  fclose(target_file);
end