%% ---------------------- Información del Script --------------------------

% PROGRAMA: Que efectúa la simulación del algoritmo Spurrier para
%           quaterniones
% OBJETIVO: Pruebas de algoritmo Spurrier
% FECHA:    26 de Julio 2021
% DISEÑO:   Ing. Cristian Vallejo

%% ------------------------ Pruebas de Spurrier ---------------------------

T = [0.0000 0.0000 0.0000 0.0000; 
     0.0000 0.0000 0.0000 0.0000; 
     0.0000 0.0000 0.0000 0.0000; 
     0      0      0      1    ];

% T = [-1.0000 -0.0000 -0.0000 -224.7959; 
%      -0.0000  1.0000  0.0000  -37.2900; 
%       0.0000  0.0000 -1.0000 -439.7823; 
%       0       0       0         1    ];

% T = [0.4226 0.0000 -0.9063 -595.0771; 
%      0.0000 1.0000  0.0000    0.0000; 
%      0.9063 0.0000  0.4226  382.9389; 
%      0      0       0         1    ];

% T = [   -0.3712    0   -0.9285 -679.7;
%          0         1    0       -22.24;
%          0.9285    0   -0.3712  -32.52;
%          0         0    0         1     ];

% T = [   -0.3139 -0.7538  -0.5773 -0.2600;
%         -0.0990 -0.5787   0.8095  0.3505;
%         -0.9443  0.3113   0.1070  0.3836;
%          0       0        0       1    ];

Rxx = T(1); Rxy = T(5); Rxz = T(9);
Ryx = T(2); Ryy = T(6); Ryz = T(10);
Rzx = T(3); Rzy = T(7); Rzz = T(11);

R=[Rxx Rxy Rxz;
   Ryx Ryy Ryz;
   Rzx Rzy Rzz];

w = trace(R);
x=0;
y=0;
z=0;
% check if w is real. Otherwise, zero it.
if( imag( w ) > 0 )
     w = 0;
end
 
[element, i ] = max( [w,Rxx,Ryy,Rzz] );

if( i == 1 )
    w = sqrt( trace( R ) + 1 ) / 2;
    x = ( Rzy - Ryz ) / (4*w);
    y = ( Rxz - Rzx ) / (4*w);
    z = ( Ryx - Rxy ) / (4*w);
end

if( i == 2 )
    x = sqrt((Rxx/2)+((1-trace(R))/4));
    w = ( Rzy - Ryz ) / (4*x);
    y = ( Ryx + Rxy ) / (4*x);
    z = ( Rzx + Rxz ) / (4*x);
end

if( i == 3 )
    y = sqrt((Ryy/2)+((1-trace(R))/4));
    w = ( Rxz - Rzx ) / (4*y);
    z = ( Rzy + Ryz ) / (4*y);
    x = ( Rxy + Ryx ) / (4*y);
    
end

if( i == 4 )
    z = sqrt((Rzz/2)+((1-trace(R))/4));
    w = ( Ryx - Rxy ) / (4*z);
    x = ( Rxz + Rzx ) / (4*z);
    y = ( Ryz + Rzy ) / (4*z);
end 

eta=w;
beta=[x; y; z];

Quaternion=[eta; beta]
