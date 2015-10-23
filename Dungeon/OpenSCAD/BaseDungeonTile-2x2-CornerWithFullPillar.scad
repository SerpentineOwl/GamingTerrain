include <ModularDungeonTileLibrary.scad>; 

mdtl_Base_2x2(size,baseheight,topperheight,topperrounded);
mdtl_Wall_2_Position(wallwidth,walllength,wallheight,walltop);
mdtl_Wall_2_Position(wallwidth,walllength,wallheight,wallright);
//Create Pillar with Modified wall
mdtl_Wall_1_Position(size,size,wallheight,wallleft);
