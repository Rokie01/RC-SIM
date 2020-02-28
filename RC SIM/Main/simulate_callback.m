%Author: Timothy Rokebrand
%The purpose of this function is to execute the necessary processes to create
%the necessary files and collate the information to perform the necessary 
%simulations upon the user pressing the simulate button.

function simulate_callback(gcf, event_data, main_window_handle)
  settings = get(main_window_handle.simulation_button, 'UserData');
  structure = get(main_window_handle.add_element_button,'UserData');
  simulate(settings, structure);
end