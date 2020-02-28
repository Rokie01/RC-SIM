clf;
%addpath('/home/rokie/Documents/matlab2tikz-master/src');
             
 patch_vertices = [ -1, -1, 0.5;
             -0.25, -1, 0.5;
             -0.25, -1.5, 0.5;
             0.25, -1.5, 0.5;
             0.25, -1, 0.5;
             1, -1, 0.5;
             1, 1, 0.5;
             -1, 1, 0.5]
             
 patch_faces = [1:8];
  patch ("Vertices", patch_vertices, "Faces", patch_faces, "FaceColor", [0.722 0.451 0.2]);
  hold on;           
ground_vertices = [ -2, -2, 0;
             2, -2, 0;
             2, 2, 0;
             -2, 2, 0;]
             
 ground_faces = [1:4];
patch ("Vertices", ground_vertices, "Faces", ground_faces, "FaceColor", [0.722 0.451 0.2]);
             
 substrate_vertices = [-1.5, -1.5, 0.499;
                        1.5, -1.5, 0.499;
                        1.5, 1.5, 0.499;
                        -1.5, 1.5, 0.499;
             
             1.5, -1.5 0.49;
             1.5, -1.5 0;
             -1.5, -1.5 0;
             -1.5, -1.5 0.49;
             
             1.5, 1.5 0.49;
             1.5, 1.5 0;
             -1.5, 1.5 0;
             -1.5, 1.5 0.49;
             
             1.5, 1.5 0.49;
             1.5, 1.5 0;
             1.5, -1.5 0;
             1.5, -1.5 0.49;
             
             -1.5, 1.5 0.49;
             -1.5, 1.5 0;
             -1.5, -1.5 0;
             -1.5, -1.5 0.49];
 substrate_faces = [1:4;
          5:8;
          9:12;
          13:16;
          17:20];
 patch ("Vertices", substrate_vertices, "Faces", substrate_faces, "FaceColor", "g");
 %patch ("Vertices", vertices, "Faces", faces, "FaceColor", "r");
 view (-37.5, 30);
 zlim([0 2]);
 rotate3d;
 box off;
 title ('"FaceColor" = "flat"');
% matlab2tikz('/home/rokie/ownCloud/Documents/Masters/myfile3.tex')