function simulation_setup(gcf, event_data,varargin)  
setup_window.menu = figure('NumberTitle','off','name','Simulation Setup', 'position', [800 100 500 800], 'color',[0.94 0.94 0.94], 'Resize', 'off');
setup_window.single_frequency_radio = uicontrol('style', 'radiobutton', 'string', 'Single Frequency', 'position', [50 750 150 35], 'Value', 1);
setup_window.multiple_frequency_radio = uicontrol('style', 'radiobutton', 'string', 'Frequency Range', 'position', [300 750 150 35], 'Value', 0);
setup_window.frequency_text = uicontrol('style', 'text', 'string', 'Frqeuncy (MHz):', 'position', [50 720 150 35]);
setup_window.end_frequency_text = uicontrol('style', 'text', 'string', 'End Frqeuncy (MHz):', 'position', [50 690 150 35], 'visible', 'off');
setup_window.frequency_increment_text = uicontrol('style', 'text', 'string', 'Frequency Step (MHz)', 'position', [50 660 150 35], 'visible', 'off');
setup_window.frequency_value = uicontrol('style', 'edit', 'string', '300','position', [250 725 200 20], 'backgroundcolor', [ 1, 1, 1]);
setup_window.end_frequency_value = uicontrol('style', 'edit', 'string', '350',...
'position', [250 695 200 20], 'backgroundcolor', [ 1, 1, 1], 'visible', 'off');
setup_window.frequency_increment_value = uicontrol('style', 'edit', 'string', '1',...
 'position', [250 665 200 20], 'backgroundcolor', [ 1, 1, 1], 'visible', 'off');
 
setup_window.plot_text= uicontrol('style', 'text', 'string', 'Radiation Plot Settings:', 'position', [50 600 200 35]);
setup_window.three_dimensions_radio = uicontrol('style', 'radiobutton', 'string', '3-D', 'position', [50 575 100 35]);
setup_window.two_dimensions_radio = uicontrol('style', 'radiobutton', 'string', '2-D', 'position', [200 575 100 35]);
setup_window.theta_start_text = uicontrol('style', 'text', 'string', 'Theta Starting Point:', 'position', [50 550 200 35]);
setup_window.theta_end_text = uicontrol('style', 'text', 'string', 'Theta End Point:', 'position', [50 520 200 35]);
setup_window.theta_start_value = uicontrol('style', 'edit', 'string', '0','position', [260 555 200 20], 'backgroundcolor', [ 1, 1, 1]);
setup_window.theta_end_value = uicontrol('style', 'edit', 'string', '360','position', [260 525 200 20], 'backgroundcolor', [ 1, 1, 1]);
setup_window.phi_start_text = uicontrol('style', 'text', 'string', 'Phi Starting Point:', 'position', [50 490 200 35]);
setup_window.phi_end_text = uicontrol('style', 'text', 'string', 'Phi End Point:', 'position', [50 460 200 35]);
setup_window.phi_start_value = uicontrol('style', 'edit', 'string', '0','position', [260 495 200 20], 'backgroundcolor', [ 1, 1, 1]);
setup_window.phi_end_value = uicontrol('style', 'edit', 'string', '180','position', [260 465 200 20], 'backgroundcolor', [ 1, 1, 1]);
setup_window.plot_increment_text = uicontrol('style', 'text', 'string', 'Increment Size:', 'position', [50 430 200 35]);
setup_window.plot_increment_value = uicontrol('style', 'edit', 'string', '45','position', [260 435 200 20], 'backgroundcolor', [ 1, 1, 1]);

setup_window.ground_text= uicontrol('style', 'text', 'string', 'Ground Plane Settings:', 'position', [50 350 200 35]);
setup_window.ground_type_text= uicontrol('style', 'text', 'string', 'Ground Type:', 'position', [50 320 200 25]);
setup_window.ground_list = uicontrol('Style', 'popupmenu','String', {'No Ground', 'Perfect Ground'}, 'Position', [250 320 150 25]);

setup_window.apply_button = uicontrol('style', 'pushbutton', 'string', "Apply",'position',...
 [100 120 100 50], 'callback', {@apply_settings_callback,varargin{1},setup_window});
setup_window.cancel_button = uicontrol('style', 'pushbutton', 'string', "Cancel",'position',...
 [300 120 100 50], 'callback', {@close_window, setup_window.menu});

set(setup_window.single_frequency_radio, 'callback', {@update_frequency_menu, setup_window,1})
set(setup_window.multiple_frequency_radio, 'callback', {@update_frequency_menu, setup_window,2})

%if(size(get(varargin{1}.simulation_button, 'UserData'))(2) == 1)
  current_settings = get(varargin{1}.simulation_button, 'UserData');
  if(current_settings.frequency_increment > 0)
    update_frequency_menu(gcf, event_data, setup_window, 2);
end

  set(setup_window.frequency_value, 'string', num2str(current_settings.frequency_start));
  set(setup_window.end_frequency_value, 'string', num2str(current_settings.frequency_start...
      + (current_settings.frequency_increment*(current_settings.frequency_steps-1))));
  set(setup_window.frequency_increment_value, 'string', num2str(current_settings.frequency_increment));
  set(setup_window.theta_start_value, 'string', num2str(current_settings.rad_theta_start));
  set(setup_window.theta_end_value, 'string', num2str(current_settings.rad_theta_end));
  set(setup_window.phi_start_value, 'string', num2str(current_settings.rad_phi_start));
  set(setup_window.phi_end_value, 'string', num2str(current_settings.rad_phi_end));
  set(setup_window.plot_increment_value, 'string', num2str(current_settings.rad_resolution));
  set(setup_window.ground_list, 'Value', current_settings.ground_flag+1);
  end
%end

function update_frequency_menu(gcf, event_data, setup_window_handle, case_value)
  switch(case_value)
  case 1
    set(setup_window_handle.single_frequency_radio, 'Value', 1);
    set(setup_window_handle.multiple_frequency_radio, 'Value', 0);
    set(setup_window_handle.frequency_text, 'string', 'Frqeuncy (MHz):');
    set(setup_window_handle.end_frequency_text, 'visible', 'off');
    set(setup_window_handle.end_frequency_value, 'visible', 'off');
    set(setup_window_handle.frequency_increment_text, 'visible', 'off');
    set(setup_window_handle.frequency_increment_value, 'visible', 'off');
  case 2
    set(setup_window_handle.single_frequency_radio, 'Value', 0);
    set(setup_window_handle.multiple_frequency_radio, 'Value', 1);
    set(setup_window_handle.frequency_text, 'string', 'Start Frqeuncy (MHz):');
    set(setup_window_handle.end_frequency_text, 'visible', 'on');
    set(setup_window_handle.end_frequency_value, 'visible', 'on');
    set(setup_window_handle.frequency_increment_text, 'visible', 'on');
    set(setup_window_handle.frequency_increment_value, 'visible', 'on');
  end
end

function apply_settings_callback(gcf, event_data, main_window_handle, setup_window_handle)
  if(get(setup_window_handle.single_frequency_radio, 'Value') == 1)
    settings.frequency_start = str2num(get(setup_window_handle.frequency_value,'string'));
    settings.frequency_increment = 0;
    settings.frequency_steps = 1;
   else
    settings.frequency_start = str2num(get(setup_window_handle.frequency_value,'string'));
    settings.frequency_increment = str2num(get(setup_window_handle.frequency_increment_value, 'string'));
    settings.frequency_steps = int16((str2num(get(setup_window_handle.end_frequency_value,'string')) -...
      settings.frequency_start)/settings.frequency_increment) + 1;
  end
  
    switch (get(setup_window_handle.ground_list,'Value'))
    case 1
      settings.ground_flag = 0;     
    case 2
      settings.ground_flag = 1; 
      settings.ground = ground_card(1 ,0, 0, 0);
      if(str2num(get(setup_window_handle.phi_end_value, 'string')) > 90)
        set(setup_window_handle.phi_end_value, 'string', '90');
      end
    end

  settings.rad_theta_start = str2num(get(setup_window_handle.theta_start_value, 'string'));
  settings.rad_phi_start = str2num(get(setup_window_handle.phi_start_value, 'string'));
  settings.rad_resolution = str2num(get(setup_window_handle.plot_increment_value,'string'));
  settings.rad_theta_steps = int16((str2num(get(setup_window_handle.theta_end_value, 'string'))-settings.rad_theta_start)/settings.rad_resolution)+1; 
  settings.rad_phi_steps = int16((str2num(get(setup_window_handle.phi_end_value, 'string'))-settings.rad_phi_start)/settings.rad_resolution)+1;
  settings.rad_theta_end = settings.rad_theta_start + (settings.rad_theta_steps*settings.rad_resolution)-settings.rad_resolution;  
  settings.rad_phi_end = settings.rad_phi_start + (settings.rad_phi_steps*settings.rad_resolution)-settings.rad_resolution; 
  set(main_window_handle.simulation_button(1), 'UserData', settings);
  close(setup_window_handle.menu);
  

end