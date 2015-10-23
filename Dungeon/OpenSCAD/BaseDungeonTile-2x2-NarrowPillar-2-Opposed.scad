include <ModularDungeonTileLibrary.scad>; 

mdtl_Base_2x2(size,baseheight,topperheight,topperrounded);
//Create Pillar with modified wall
mdtl_Wall_2_Position(wallwidth,wallwidth/2,wallheight,wallleft);
translate([0,walllength*2-wallwidth,0])
    mdtl_Wall_2_Position(wallwidth,wallwidth/2,wallheight,wallright);