function Quaternion =SpurrierQuaternion(T)
%%% This Matlab function calculates the quaternion from a given rotation matrix, 
%%% Spurrier's Algorithm is used in this script and a full description can be found 
%%% in (Richard A. Spurrier 1978, Klumpp enhancement). The input parameters for this
%%% function is the homogeneous matrix T_0_e. 

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

Quaternion=[eta; beta];
end