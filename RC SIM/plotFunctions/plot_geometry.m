function P = plot_geometry(ant, f)
  figure(f);
  limit = 0;
  for i = 1:max([size(ant.wire)(2) size(ant.helix)(2)])
    if(size(ant.wire)(2) >= i && ant.wire(i).tag_no > 0)
      x = [ant.wire(i).x_begin ant.wire(i).x_end];
      y = [ant.wire(i).y_begin ant.wire(i).y_end];
      z = [ant.wire(i).z_begin ant.wire(i).z_end];
      plot3(x,y,z,'b', "linewidth", 2);
      if(max([abs(x) abs(y) abs(z)]) > limit)
        limit= 1.25*max([abs(x) abs(y) abs(z)]);
      end
      xlim([-limit limit]);
      ylim([-limit limit]);
      zlim([-limit limit]);
      view([120, 48])
      hold on
      if(ant.wire(i).voltage_seg > 0)
        Xmultiplier = 1;
        Ymultiplier = 1;
        Zmultiplier = 1;
        xdist = (ant.wire(i).x_begin-ant.wire(i).x_end);
        ydist = (ant.wire(i).y_begin-ant.wire(i).y_end);
        zdist = (ant.wire(i).z_begin-ant.wire(i).z_end);
        total_segments = ant.wire(i).segments;
        voltage_segment = ant.wire(i).voltage_seg;
        
        if(ant.wire(i).x_begin < ant.wire(i).x_end)
          Xmultiplier = -1;
        end
        if(ant.wire(i).y_begin < ant.wire(i).y_end)
          Ymultiplier = -1;
        end
        if(ant.wire(i).z_begin < ant.wire(i).z_end)
          Zmultiplier = -1;
        end

        X = [ant.wire(i).x_begin - xdist*(voltage_segment-1)/total_segments ...
             ant.wire(i).x_begin - xdist*voltage_segment/total_segments];
        Y = [ant.wire(i).y_begin - ydist*(voltage_segment-1)/total_segments ...
             ant.wire(i).y_begin - ydist*voltage_segment/total_segments];
        Z = [ant.wire(i).z_begin - zdist*(voltage_segment-1)/total_segments ...
             ant.wire(i).z_begin - zdist*voltage_segment/total_segments];
        plot3(X,Y,Z,'r', "linewidth", 6);
      end
    end

    if(size(ant.helix)(2) >= i && ant.helix(i).tag_no > 0)
      theta = linspace(0, 2*(ant.helix(i).total_length/ant.helix(i).spacing)*pi, ant.helix(i).segments +1);
      radiusX = linspace(ant.helix(i).x_radius_start, ant.helix(i).x_radius_end, ant.helix(i).segments+1);
      radiusY = linspace(ant.helix(i).y_radius_start, ant.helix(i).y_radius_end, ant.helix(i).segments+1);
      for n=1:ant.helix(i).segments+1
        r(n) = 1 /sqrt(((cos(theta(n))/radiusX(n))^2) + ((sin(theta(n))/radiusY(n))^2));
      end
      slope = atan(ant.helix(i).spacing./(2*pi*r));
      z = theta.*r.*tan(slope);
      [x,y,z] = pol2cart(theta,r,z);
      plot3(x,y,z,'b', "linewidth", 2)
      view([120 48]);
      xlim([-0.5 0.5])
      ylim([-0.5 0.5])
      hold on
      X = [x(ant.helix(i).voltage_seg) x(ant.helix(i).voltage_seg+1)];
      Y = [y(ant.helix(i).voltage_seg) y(ant.helix(i).voltage_seg+1)];
      Z = [z(ant.helix(i).voltage_seg) z(ant.helix(i).voltage_seg+1)];
      plot3(X,Y,Z,'r', "linewidth", 3)
    end
    
%    if(ant.wire(i).voltage > 0)
%      [x,y,z] = sphere;
%      surf(((ant.wire(i).x_end + ant.wire(i).x_begin)/2)+(0.05*limit*x),...
%      ((ant.wire(i).y_end + ant.wire(i).y_begin)/2) + (0.05*limit*y),...
%      ((ant.wire(i).z_end + ant.wire(i).z_begin)/2) + (0.05*limit*z),...
%       'FaceColor','red','EdgeColor','none')
%    end

  end
grid
rotate3d on
hold off
% matlab2tikz('/home/rokie/ownCloud/Documents/Masters/myfile3.tex')
end