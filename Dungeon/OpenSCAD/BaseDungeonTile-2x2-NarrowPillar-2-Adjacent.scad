include <ModularDungeonTileLibrary.scad>; 

mdtl_Base_2x2(size,baseheight,topperheight,topperrounded);
//Create Pillar with modified wall
mdtl_Wall_2_Position(wallwidth,wallwidth/2,wallheight,wallleft);
mdtl_Wall_2_Position(wallwidth,wallwidth/2,wallheight,wallright);