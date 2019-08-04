f=@(x) sin(pi*x/2);
x = 0;
h = 0.5;
eps_step = 0.00001;
R(1, 1) = (f(x + h) - f(x - h))/(2*h);
for i=1:100
   h = h/2;

   R(i + 1, 1) = (f(x + h) - f(x - h))/(2*h);

   for j=1:i
      R(i + 1, j + 1) = (4^j*R(i + 1, j) - R(i, j))/(4^j - 1);
   end

   if ( abs( R(i + 1, i + 1) - R(i, i) ) < eps_step )
      disp(R)
      break;
   elseif ( i == 100 )
      error( 'Richardson extrapolation failed to converge' );
   end
end