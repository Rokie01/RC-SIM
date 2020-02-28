function plot_radiation(varargin)
  spec = '%*f %*f %*f %*f %f %*[^\n]';
  fid = fopen('output.out');
  tline = fgetl(fid);
  lineCounter = 1;
  i = 0;
  while ischar(tline)
      if strfind(tline, 'RADIATION PATTERNS')
        i = i + 1;
        tline = fgetl(fid);
        tline = fgetl(fid);
        tline = fgetl(fid);
        rad_plot(i).magnitude = fscanf(fid,spec);
      end
      tline = fgetl(fid);
  end
  fclose(fid);
  j=1;
  theta = varargin{1}.rad_theta_start:varargin{1}.rad_resolution:varargin{1}.rad_theta_end;
  phi = 90 - varargin{1}.rad_phi_start:-varargin{1}.rad_resolution:90 - varargin{1}.rad_phi_end;
  theta = theta*pi/180;
  phi = (phi)*pi/180;

  [phi theta] = meshgrid(phi, theta);
  for(j= 1:size(rad_plot)(2))
    i=1;
    for(n = 1:size(theta))
      for(m = 1:size(theta)(2))
          rad_plot(j).rho(n,m) = rad_plot(j).magnitude(i);
          i = i +1; 
      end
    end
  end

  radiation_plot.fig = figure('NumberTitle','off','Name','NEC Radiation Plot', 'Position', [100 80 900 600]);
  radiation_plot.axes = axes('Units', 'Pixels',...
 'Title', 'NEC Radiation Plot', 'position', [50 150 400 400],...
 'XlimMode', 'manual','YlimMode', 'manual', 'ZlimMode', 'manual',...
 'xlabel', 'X', 'ylabel', 'Y', 'zlabel', 'Z', 'view', [-60, 48]);
  radiation_plot.frequency_value = uicontrol('style','text',...
  'String', ['Frequency: ' num2str(varargin{1}.frequency_start) ' MHz'],'Position', [150 20 150 20]);
  radiation_plot.max_gain_value = uicontrol('style','text',...
  'String', ['Maximum Gain: ' num2str(10^(max(rad_plot(j).magnitude)/10))],'Position', [500 410 250 20]);
  radiation_plot.max_gain_db_value = uicontrol('style','text',...
  'String', ['Maximum Gain in dB: ' num2str(max(rad_plot(j).magnitude)) ' dB'],'Position', [500 370 250 20]);
  radiation_plot.frequency_slider = uicontrol('style','slider',...
  'Min',varargin{1}.frequency_start,...
  'Max',varargin{1}.frequency_start+(varargin{1}.frequency_increment*(varargin{1}.frequency_steps-1)),...
  'Value',varargin{1}.frequency_start,'Position', [20 40 400 20],...
  'visible', 'on');
  
  step = get(radiation_plot.frequency_slider,'Max')-get(radiation_plot.frequency_slider,'Min');
  if(step == 0)
    step = 1;
    set(radiation_plot.frequency_slider, 'visible', 'off');
  end
  if((size(theta)(2) == 1 && size(phi)(2) == 1 && size(rad_plot(1).magnitude)(2) == 1))
     polar(theta,10.^((rad_plot(1).magnitude)/10),'r')
  else
  pattern_plot(rad_plot, 1, theta, phi,varargin{2}, radiation_plot.fig);
    

end
  set(radiation_plot.frequency_slider,'SliderStep', [varargin{1}.frequency_increment/step 1]);
  set(radiation_plot.frequency_slider, 'callback', {@frequency_update, radiation_plot, rad_plot, phi, theta, varargin{1}.frequency_increment, varargin{2}});
 end

function frequency_update(gcf, event_data,radiation_plot, rad_plot, phi, theta, frequency_increment, structure)
  set(radiation_plot.frequency_value,'String',...
  ['Frequency: ' num2str(int32(get(radiation_plot.frequency_slider,'Value'))) ' MHz']); 

  if(frequency_increment == 0)
    j = 1;
  else
    j = (int32(get(radiation_plot.frequency_slider,'Value')) -...
      get(radiation_plot.frequency_slider,'Min'))/frequency_increment + 1
  end
  set(radiation_plot.max_gain_value, 'String',...
  ['Maximum Gain: ' num2str(10^(max(rad_plot(j).magnitude)/10))]);
  set(radiation_plot.max_gain_db_value, 'String',...
  ['Maximum Gain in dB: ' num2str(max(rad_plot(j).magnitude)) ' dB']);

  if((size(theta)(2) == 1 &&size(phi)(2) == 1 && size(rad_plot(j).magnitude)(2) == 1))
    cla
     polar(theta,10.^((rad_plot(j).magnitude)/10), 'r')
  else
  pattern_plot(rad_plot, j, theta, phi, structure, radiation_plot.fig);
  end
end  
 
function pattern_plot(rad_plot, j, theta, phi, structure, f)
  cla
  figure(f);
  %plot_geometry(structure, f);
  rad_plot(j).rho = 10.^(rad_plot(j).rho/10);
  limit = ceil(10^(max(rad_plot(j).magnitude)/10));
  max_gain = max(rad_plot(j).magnitude);
  [X,Y,Z] = sph2cart(theta, phi,rad_plot(j).rho);
  colormap(jet)
%  if((size(X)(2) == 1 && size(Y)(2) == 1 && size(Z)(2) == 1)||...
%     (size(X)(1) == 1 && size(Y)(1) == 1 && size(Z)(1) == 1))
%     polar(X,Z)
%  else
  surface(X,Y,Z,'EdgeColor','none','Cdata', rad_plot(j).rho)
  view([45 20])
  rotate3d on
  ylim([-limit limit])
  zlim([-limit limit])
  xlim([-limit limit]) 
  %matlab2tikz('/home/rokie/ownCloud/Documents/Masters/myfile2.tex')
end