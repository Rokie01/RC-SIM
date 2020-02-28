function plot_vswr(varargin)
  spec = '%*f %*f %*f %*f %*f %*f %f %f %*[^\n]';
  fid = fopen('output.out');
  tline = fgetl(fid);
  lineCounter = 1;
  i = 0;
  while ischar(tline)
      if strfind(tline, 'ANTENNA INPUT PARAMETERS')
        i = i + 1;
        tline = fgetl(fid);
        tline = fgetl(fid);
        values = fscanf(fid,spec);
        impedance.resistance(i) = values(1);
        impedance.reactance(i) = values(2);
        %Zl = impedance.resistance(i) + j(impedance.reactance(i))     
      end
      tline = fgetl(fid);
  end
  fclose(fid);
  freq = 100:500;
%  impedance_plot.fig = figure('NumberTitle','off','Name','Radiation Plot', 'Position', [100 80 900 600]);
%  impedance_plot.ax(1) = ax('Units', 'Pixels',...
% 'Title', 'Radiation Plot', 'position', [50 150 400 400],...
% 'XlimMode', 'manual','YlimMode', 'manual',...
% 'xlabel', 'X', 'ylabel', 'Y');
%   impedance_plot.ax(2) = ax('Units', 'Pixels',...
% 'Title', 'Radiation Plot', 'position', [50 150 400 400],...
% 'XlimMode', 'manual','YlimMode', 'manual',...
% 'xlabel', 'X', 'ylabel', 'Y');
%%  plot(freq,impedance.reactance,'linewidth',1.5)
%%  hold on
figure('NumberTitle','off','name', 'Impedance Plot')
  [imp_plot, reac_plot, res_plot] = plotyy(freq,impedance.reactance,freq,impedance.resistance);
  set(reac_plot,'linewidth',1.8)
  set(res_plot,'linewidth',1.8)
  legend([reac_plot;res_plot],'Reactance (ohms)','Resistance (ohms)'); 
  grid on;
  set(imp_plot, 'xlabel', 'Frequency(MHz)', 'Title', 'Impedance Plot')
%  hold off
end 
 
%function pattern_plot(rad_plot, j, theta, phi, structure, f)
%  cla
%  %plot_geometry(structure, f);
%  rad_plot(j).rho = 10.^(rad_plot(j).rho/10);
%  limit = int16(10^(max(rad_plot(j).magnitude)/10))+1;
%  [X,Y,Z] = sph2cart(theta, phi,rad_plot(j).rho);
%  colormap(jet)
%  if((size(X)(2) == 1 && size(Y)(2) == 1 && size(Z)(2) == 1)||...
%     (size(X)(1) == 1 && size(Y)(1) == 1 && size(Z)(1) == 1))
%  plot3(X,Y,Z, 'linewidth', 2);
%  else
%  surface(X,Y,Z,'FaceColor','texturemap','EdgeColor','none','Cdata', rad_plot(j).rho)
%  view([45 20])
%  end
%
%  rotate3d on
%  ylim([-limit limit])
%  zlim([-limit limit])
%  xlim([-limit limit]) 
%end