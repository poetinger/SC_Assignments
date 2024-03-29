function [F] = simulate1D(D, duration)
%Simulates the reaction diffusion system

% Initialize F with a centered impulse
F = zeros([1 101]);
F(51) = 1;

% Set step size and number of steps
Delta_t = 1/(4*D);
num_steps = duration/Delta_t;

% Evolve F
for i=1:num_steps
    F1 = circshift(F, [1, 1]);
    F2 = circshift(F, [1, -1]);
    dFdt = D*(F1 + F2 - 2*F);
    F = F + Delta_t*dFdt;
end

end
