function simulate(settings, structure)
  outputFile = "input.nec";
  outputFile2 = "input.pre";
  fopen(outputFile, 'w');
  fopen(outputFile2, 'w');
  TITLE(outputFile2);
  counter = 0;
  simulation_frequency = frequency_card(0, settings.frequency_steps, settings.frequency_start, settings.frequency_increment);

  if(structure.wire(1).tag_no > 0)
  writeGeometryNEC(outputFile, structure.wire);
  DP(outputFile2, structure.wire);
  BL(outputFile2, structure.wire);
  EG(outputFile2);

    for(i = 1:size(structure.wire)(2))
      if(structure.wire(i).voltage > 0)
        counter = counter + 1;
        simulation_excitation(counter) = excitation_card(0,...
        structure.wire(i).tag_no, structure.wire(i).voltage_seg,...
        structure.wire(i).voltage);
        A1(outputFile2, structure.wire(i));
      end
    end
  FR(outputFile2, settings);
  FF(outputFile2, settings); 
  EN(outputFile2); 
  end

  if(structure.helix(1).tag_no > 0)
  writeHelixNEC(outputFile, structure.helix);
    for(i = 1:size(structure.helix)(2))
      if(structure.helix(i).voltage > 0)
        counter = counter + 1;
        simulation_excitation(counter) = excitation_card(0,...
        structure.helix(i).tag_no, structure.helix(i).voltage_seg, structure.helix(i).voltage);
      end
    end
  end
  target_file = fopen(outputFile, 'at');
  fprintf(target_file,'GE \n')
  fclose(target_file);
  if(settings.ground_flag == 1) 
    writeGroundNEC(outputFile, settings.ground);
  end

  writeFrequencyNEC(outputFile, simulation_frequency);
  writeExcitationNEC(outputFile, simulation_excitation);
  writePatternNEC(settings);
  
  system('nec2++ -i input.nec -o output.out');
  system('export ALTAIR_LICENSE_PATH=6200@Altair.eie.wits.ac.za; runfeko input.pre --execute-prefeko');
  [status,cmdout]=system('xnecview input.nec output.out'); 
  plot_radiation(settings, structure);
  plot_feko_radiation(settings, structure);
% plot_vswr(settings);
end