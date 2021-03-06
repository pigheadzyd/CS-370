function [Z] = ModifiedEuler(f, t_0, t_f, N, z_0)
	Z = zeros(N+1, length(z_0));
	Z(1, :) = z_0';
	dt = (t_f - t_0) / N;
	for n = 1:N
		t = t_0 + (n-1) * dt;
    t_1 = t_0 + n * dt;
    z_star = z_0 + f(t, z_0) * dt;
		z_0 = z_0 +  dt/2 * ( f(t, z_0) + f(t_1,z_star) );
		Z(n+1, :) = z_0';
	end
end