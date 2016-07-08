// Gmsh project created on Fri Jul  8 10:55:07 2016
sc = DefineNumber [ 2.5, Name "Parameters/sc" ];
sc2 = DefineNumber[ 2.5, Name "Parameters/sc2" ];
// Define circle edges.
Point(1)  = {   0.0             , 168.0,   0.0             , sc};
Point(2)  = {  19.79898987322330, 168.0,  19.79898987322330, sc};
Point(3)  = { -19.79898987322330, 168.0,  19.79898987322330, sc};
Point(4)  = { -19.79898987322330, 168.0, -19.79898987322330, sc};
Point(5)  = {  19.79898987322330, 168.0, -19.79898987322330, sc};

// Define edges of domain.
Point(6)  = {-168.0, 168.0, -168.0, sc2};
Point(7)  = { 168.0, 168.0, -168.0, sc2};
Point(8)  = { 168.0, 168.0,  168.0, sc2};
Point(9)  = {-168.0, 168.0,  168.0, sc2};

// Circle
Circle(10) = {2, 1, 3};
Circle(11) = {3, 1, 4};
Circle(12) = {4, 1, 5};
Circle(13) = {5, 1, 2};

// Border
Line(14) = {6, 7};
Line(15) = {7, 8};
Line(16) = {8, 9};
Line(17) = {9, 6};
Line(18) = {6, 4};
Line(19) = {7, 5};
Line(20) = {8, 2};
Line(21) = {9, 3};

Line Loop(22) = {11, 12, 13, 10};
Plane Surface(23) = {22};
Line Loop(24) = {14, 19, -12, -18};
Plane Surface(25) = {24};
Line Loop(26) = {15, 20, -13, -19};
Plane Surface(27) = {26};
Line Loop(28) = {16, 21, -10, -20};
Plane Surface(29) = {28};
Line Loop(30) = {17, 18, -11, -21};
Plane Surface(31) = {30};

Transfinite Line {11, 12, 13, 10, 14, 15, 16, 17, 18, 19, 20, 21} = 64 Using Progression 1;

Transfinite Surface {23};
Transfinite Surface {27};
Transfinite Surface {25};
Transfinite Surface {31};
Transfinite Surface {29};
Recombine Surface {23, 27, 25, 31, 29};

Extrude {0, -168.0, 0} {
  Surface{23, 27, 25, 31, 29};
  Layers{64};
  Recombine;
}
Physical Surface("Hole") = {23};
Physical Surface("Upper") = {29, 31, 25, 27};
Physical Surface("Lower") = {53, 75, 97, 119, 141};
Physical Surface("Left") = {106};
Physical Surface("Right") = {62};
Physical Surface("Behind") = {84};
Physical Surface("Front") = {128};
Physical Volume("intenal") = {4, 1, 5, 2, 3};
