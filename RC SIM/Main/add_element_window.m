function add_element_window(gcf, event_data,main_window_handle,fig)
    
  add_window.menu = figure('NumberTitle','off','name','Add Element', 'position', [800 100 500 650], 'color',[0.94 0.94 0.94], 'Resize', 'off');
  add_window.text_message_pre = uicontrol('style', 'text','string','Select Antenna:','position', [20 615 150 20]);
  add_window.predesigned_list = uicontrol('Style', 'popupmenu','String', {'Custom','Half-Wavelength Dipole','Standard Yagi-Uda Antenna', 'Standard Patch'}, 'Position', [180 615 200 20]); 
  add_window.text_message = uicontrol('style', 'text','string','Select element type:','position', [20 590 150 20]);
  add_window.element_list = uicontrol('Style', 'popupmenu','String', {'Wire','Helical Antenna','Patch', 'Yagi-Uda Array'}, 'Position', [180 590 150 20]); 
  add_window.segment_text = uicontrol('style', 'text', 'String', 'Number of Segments:', 'position', [40 400 150 20], 'visible', 'on');
  add_window.segment_input = uicontrol('style', 'edit', 'String', '11', 'position', [210 400 100 20], 'backgroundcolor', [1 1 1], 'visible', 'on');
  add_window.radio_active = uicontrol('style', 'radiobutton', 'string', 'Active Element','position', [20 350 150 30], 'visible','on');
  add_window.voltage_text = uicontrol('style', 'text','string','Insert Voltage:','position', [20 320 150 20],'visible','off');
  add_window.voltage_input = uicontrol ("style", "edit", "string", "1.00","position",[170 320 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.voltage_seg_text = uicontrol('style', 'text', 'string', 'Active Segment:', 'position', [20 290 150 20], 'visible', 'off');
  add_window.voltage_seg_input = uicontrol('style', 'edit', 'string', '6', 'position', [170 290 150 20], 'visible', 'off');
  add_window.submit_button = uicontrol('style','pushbutton','string', 'Add Element','position', [25 55 150 35]);
  add_window.cancel_button = uicontrol('style','pushbutton','string', 'Cancel','position', [325 55 150 35], 'callback', {@close_window,add_window.menu});
  
  %straight wire geometry capture
  add_window.text_x1 = uicontrol('style', 'text', 'string', 'X1:', 'position', [50 550 50 20],'visible','on');
  add_window.text_y1 = uicontrol('style', 'text', 'string', 'Y1:', 'position', [50 500 50 20],'visible','on');
  add_window.text_z1 = uicontrol('style', 'text', 'string', 'Z1:', 'position', [50 450 50 20],'visible','on');
  add_window.text_x2 = uicontrol('style', 'text', 'string', 'X2:', 'position', [250 550 50 20],'visible','on');
  add_window.text_y2 = uicontrol('style', 'text', 'string', 'Y2:', 'position', [250 500 50 20],'visible','on');
  add_window.text_z2 = uicontrol('style', 'text', 'string', 'Z2:', 'position', [250 450 50 20],'visible','on');
  add_window.x1_input = uicontrol ("style", "edit", "string", "0.25","position",[100 550 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  add_window.x2_input = uicontrol ("style", "edit", "string", "-0.25","position",[300 550 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  add_window.y1_input = uicontrol ("style", "edit", "string", "0.00","position",[100 500 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  add_window.y2_input = uicontrol ("style", "edit", "string", "0.00","position",[300 500 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  add_window.z1_input = uicontrol ("style", "edit", "string", "0.00","position",[100 450 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  add_window.z2_input = uicontrol ("style", "edit", "string", "0.00","position",[300 450 100 20], 'backgroundcolor', [1 1 1],'visible','on');
  
  %helical geometry capture
  add_window.text_helix_spacing = uicontrol('style', 'text', 'string', 'Turn Spacing:', 'position', [50 550 100 20],'visible','off');
  add_window.text_helix_length = uicontrol('style', 'text', 'string', 'Helix Length:', 'position', [50 500 100 20],'visible','off');
  add_window.text_helix_radius = uicontrol('style', 'text', 'string', 'Radius:', 'position', [50 450 100 20],'visible','off');
  add_window.helix_spacing_input = uicontrol ("style", "edit", "string", "0.10","position",[150 550 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.helix_length_input = uicontrol ("style", "edit", "string", "0.50","position",[150 500 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.helix_radius_input = uicontrol ("style", "edit", "string", "0.10","position",[150 450 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  
  %yagi antenna array geometry capture
  add_window.text_elements = uicontrol('style', 'text', 'string', 'Number of Elements', 'position', [50 550 200 20], 'visible', 'off');
  add_window.text_driven_length = uicontrol('style', 'text', 'string', 'Driven Element Length', 'position', [50 500 200 20], 'visible', 'off');
  %add_window.text_voltage = uicontrol('style', 'text', 'string', 'Driven Element Voltage', 'position', [50 550 100 20], 'visible', 'off');
  add_window.text_reflector_length = uicontrol('style', 'text', 'string', 'Reflector Length', 'position', [50 400 200 20], 'visible', 'off');
  add_window.text_director_length = uicontrol('style', 'text', 'string', 'Director Length', 'position', [50 350 200 20], 'visible', 'off');
  add_window.text_drivenReflector_spacing = uicontrol('style', 'text', 'string', 'Driven-Reflector Spacing', 'position', [50 300 200 20], 'visible', 'off');
  add_window.text_drivenDirector_spacing = uicontrol('style', 'text', 'string', 'Driven-Director Spacing', 'position', [50 250 200 20], 'visible', 'off');
  add_window.text_director_spacing = uicontrol('style', 'text', 'string', 'Director Spacing', 'position', [50 200 200 20], 'visible', 'off');
  add_window.elements_input = uicontrol ("style", "edit", "string", "0.10","position",[250 550 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.driven_length_input = uicontrol ("style", "edit", "string", "0.10","position",[250 500 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  %add_window.voltage_input = uicontrol ("style", "edit", "string", "0.10","position",[150 550 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.reflector_length_input = uicontrol ("style", "edit", "string", "0.10","position",[250 400 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.director_length_input = uicontrol ("style", "edit", "string", "0.10","position",[250 350 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.drivenReflector_spacing_input = uicontrol ("style", "edit", "string", "0.10","position",[250 300 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.drivenDirector_spacing_input = uicontrol ("style", "edit", "string", "0.10","position",[250 250 100 20], 'backgroundcolor', [1 1 1],'visible','off');
  add_window.director_spacing_input = uicontrol ("style", "edit", "string", "0.10","position",[250 200 100 20], 'backgroundcolor', [1 1 1],'visible','off'); 
  
  set(add_window.submit_button,'Callback', {@add_element_callback, main_window_handle, add_window, fig})
  set(add_window.predesigned_list,'callback', {@predesigned_detail_callback, main_window_handle, add_window})
  set(add_window.element_list,'callback', {@element_detail_callback, add_window});
  set(add_window.radio_active,'callback', {@voltage_detail_callback, add_window});
end

function predesigned_detail_callback(gcf, event_data, main_window_handle, add_window)
  constants;
  settings = get(main_window_handle.simulation_button, 'UserData');
  wavelength = light_speed/(settings.frequency_start*1e6);
  switch (get(add_window.predesigned_list,'Value'))
    case 2 
      show_hide(add_window, 1, 0, 0);
      set(add_window.element_list,'Value',1);
      set(add_window.x1_input,'String',num2str(wavelength/4));
      set(add_window.x2_input,'String',num2str(-wavelength/4));
      set(add_window.y1_input,'String',num2str(0));
      set(add_window.y2_input,'String',num2str(0));
      set(add_window.z1_input,'String',num2str(0));
      set(add_window.z2_input,'String',num2str(0));
      show_hide(add_window, 1, 0, 0);
    case 3
      set(add_window.element_list,'Value',4);
      show_hide(add_window, 0, 0, 1); 
      set(add_window.driven_length_input,'String',num2str(wavelength*0.46));
      set(add_window.drivenReflector_spacing_input,'String',num2str(0.25*wavelength));
      set(add_window.drivenDirector_spacing_input,'String',num2str(0.31*wavelength));
      set(add_window.reflector_length_input,'String',num2str(0.475*wavelength));
      set(add_window.director_length_input,'String',num2str(0.44*wavelength));
      set(add_window.director_spacing_input,'String',num2str(0.31*wavelength));
      set(add_window.elements_input,'String',num2str(12));
      
    case 4
      show_hide(add_window, 0, 0, 1);
      set_yagi_default(add_window,...
      get(main_window_handle.simulation_button,'UserData')); 
  end
end

function element_detail_callback(gcf, event_data,add_window)
  switch (get(add_window.element_list,'Value'))
    case 1 
      show_hide(add_window, 1, 0, 0);
    case 2
      show_hide(add_window, 0, 1, 0); 
    case 4
      show_hide(add_window, 0, 0, 1);
      set_yagi_default(add_window,...
      get(main_window_handle.simulation_button,'UserData')); 
  end
end

function voltage_detail_callback(gcf, event_data,add_window)
  %Deal with voltage prompts
  if(get(add_window.radio_active,'Value') == 1)
    set(add_window.voltage_text,'visible','on');
    set(add_window.voltage_input,'visible','on');
    set(add_window.voltage_seg_text,'visible','on');
    set(add_window.voltage_seg_input,'visible','on');
  else
    set(add_window.voltage_text,'visible','off');
    set(add_window.voltage_input,'visible','off');
    set(add_window.voltage_seg_text,'visible','off');
    set(add_window.voltage_seg_input,'visible','off');
  end
end

function show_hide(add_window, wire_flag, helix_flag, yagi_flag)
  if(wire_flag == 0)
    switcher = 'off';
  else 
    switcher = 'on';
    set(add_window.radio_active,'visible','on');
    set(add_window.segment_input, 'position', [210 400 100 20],'visible',switcher);
    set(add_window.segment_text, 'position', [40 400 150 20],'visible',switcher);
    set(add_window.voltage_seg_input, 'position', [170 290 100 20],'visible','off');
    set(add_window.voltage_seg_text, 'position', [20 290 150 20],'visible','off');
    set(add_window.voltage_text, 'position', [20 320 150 20], 'visible', 'off');
    set(add_window.voltage_input, 'position', [170 320 100 20], 'visible', 'off');
  end
  
  set(add_window.text_x1,'visible',switcher);
  set(add_window.text_y1,'visible',switcher);
  set(add_window.text_z1,'visible',switcher);
  set(add_window.text_x2,'visible',switcher);
  set(add_window.text_y2,'visible',switcher);
  set(add_window.text_z2,'visible',switcher);
  set(add_window.x1_input,'visible',switcher);
  set(add_window.x2_input,'visible',switcher);
  set(add_window.y1_input,'visible',switcher);
  set(add_window.y2_input,'visible',switcher);
  set(add_window.z1_input,'visible',switcher);
  set(add_window.z2_input,'visible',switcher);
  %set(add_window.radio_active,'visible',switcher);
  
  if(helix_flag == 0)
    switcher = 'off';
  else 
    switcher = 'on';
    set(add_window.radio_active,'visible','on');
    set(add_window.segment_input, 'position', [210 400 100 20],'visible',switcher);
    set(add_window.segment_text, 'position', [40 400 150 20],'visible',switcher);
    set(add_window.voltage_seg_input, 'position', [170 290 100 20],'visible','off');
    set(add_window.voltage_seg_text, 'position', [20 290 150 20],'visible','off');
    set(add_window.voltage_text, 'position', [20 320 150 20], 'visible', 'off');
    set(add_window.voltage_input, 'position', [170 320 100 20], 'visible', 'off');
  end
  
  set(add_window.text_helix_length,'visible',switcher);
  set(add_window.text_helix_spacing,'visible',switcher);
  set(add_window.text_helix_radius,'visible',switcher);
  set(add_window.helix_spacing_input,'visible',switcher);
  set(add_window.helix_length_input,'visible',switcher);
  set(add_window.helix_radius_input,'visible',switcher);
  
  if(yagi_flag == 0)
    switcher = 'off';
  else 
    switcher = 'on';
    set(add_window.radio_active,'visible','off', 'Value', 0);
    set(add_window.voltage_seg_text, 'position', [50 100 200 20],'visible',switcher);
    set(add_window.voltage_seg_input, 'position', [250 100 100 20],'visible',switcher);
    set(add_window.segment_input, 'position', [250 150 100 20],'visible',switcher);
    set(add_window.segment_text, 'position', [50 150 200 20],'visible',switcher);
    set(add_window.voltage_text, 'position', [50 450 200 20], 'visible', switcher);
    set(add_window.voltage_input, 'position', [250 450 100 20], 'visible', switcher);
  end
  
  set(add_window.text_elements, 'visible', switcher);
  set(add_window.text_driven_length, 'visible', switcher);
  %set(add_window.text_voltage, 'visible', switcher);
  set(add_window.text_reflector_length, 'visible', switcher);
  set(add_window.text_director_length, 'visible', switcher);
  set(add_window.text_drivenReflector_spacing, 'visible', switcher);
  set(add_window.text_drivenDirector_spacing, 'visible', switcher);
  set(add_window.text_director_spacing, 'visible', switcher);
  set(add_window.elements_input, 'visible', switcher);
  set(add_window.driven_length_input, 'visible', switcher);
  %set(add_window.voltage_input, 'visible', switcher);
  set(add_window.reflector_length_input, 'visible', switcher);
  set(add_window.director_length_input, 'visible', switcher);
  set(add_window.drivenReflector_spacing_input, 'visible', switcher);
  set(add_window.drivenDirector_spacing_input, 'visible', switcher);
  set(add_window.director_spacing_input, 'visible', switcher);
end