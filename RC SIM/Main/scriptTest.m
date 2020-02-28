  addpath('../geometryDefs/');
  addpath('../plotFunctions');
  addpath('../writeNEC');
  addpath('../writeFeko');

    ant = struct('wire',wire(0),'helix',helix(0), 'no_of_elements', 0);
    ant.no_of_elements = ant.no_of_elements +1;
    i = 1;
    yagi_wires = yagi(ant.no_of_elements,12,0.5,0.6,0.45,0.15,0.1,0.1,0.001,5,1,3);
    for j= 1:size(yagi_wires)(2)
      ant.wire(i) = yagi_wires(j);
      i = i+1;
    end
    plot_geometry(ant, figure);  
  settings.frequency_start = 300;
  settings.frequency_increment = 0;
  settings.frequency_steps = 1;
  settings.ground_flag = 0;     
  settings.ground = ground_card(1 ,0, 0, 0);
  settings.rad_theta_start = 0;
  settings.rad_phi_start = 0;
  settings.rad_resolution = 1;
  settings.rad_theta_steps = 181; 
  settings.rad_phi_steps = 361; 
  settings.rad_theta_end = 180;  
  settings.rad_phi_end = 360;
  simulate(settings, ant);