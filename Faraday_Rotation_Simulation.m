% Last updated: 2026-07-30 by Alice Calvert
% This is a function that calculates the Faraday rotation (Phi) [rad] of a 
% material from the Jones Vectors and Stokes Parameters. 
% The inputs are the in-plane and out-of-plane components of the
% incident and transmitted Jones Vectors amplitudes.
% The output is the angle of Faraday rotation (Phi).

% ------------------------------------------------------------- %
% ------------------------- References ------------------------ %
% ------------------------------------------------------------- %
% [1] H. Majeed, A. Shaheen, and M.S. Anwar, "Complete Stokes polarimetry of 
% magneto-optical Faraday effect in a terbium gallium garnet crystal at cryogenic 
% temperatures," Opt. Express, OE 21(21), 25148–25158 (2013).
% [2] Y. Huang, H. Chen, W. Dong, F. Pang, J. Wen, Z. Chen, and T. Wang, 
% "Fabrication of europium-doped silica optical fiber with high Verdet constant,"
% Opt. Express, OE 24(16), 18709–18717 (2016).

% ------------------------------------------------------------- %
% ----------------- Faraday Rotation Function ----------------- %
% ------------------------------------------------------------- %

function [Phi]=Faraday_Rotation_Simulation(emw_JIIP_0_0, emw_JIOOP_0_0, emw_JTIP_0_0, emw_JTOOP_0_0)

tic %start timing run

% ----------------------- Jones Vectors ----------------------- %

% Incident light

E_ip = emw_JIIP_0_0;              %incident Jones Vector amplitude, in-plane component
E_is = emw_JIOOP_0_0;             %incident Jones Vector amplitude, out-of-plane component

E0_ip = abs(E_ip);                 %incident in-plane amplitude
E0_is = abs(E_is);                 %incident out-of-plane amplitude
delta_E_ip = angle(E_ip);          %incident in-plane phase
delta_E_is = angle(E_is);          %incident out-of-plane phase

% Transmitted light

E_tp = emw_JTIP_0_0;              %transmitted Jones Vector amplitude, in-plane component
E_ts = emw_JTOOP_0_0;             %transmitted Jones Vector amplitude, out-of-plane component
    
E0_tp = abs(E_tp);                 %transmitted in-plane amplitude
E0_ts = abs(E_ts);                 %transmitted out-of-plane amplitude
delta_E_tp = angle(E_tp);          %transmitted in-plane phase
delta_E_ts = angle(E_ts);          %transmitted out-of-plane phase

% ------------------- Stokes Parameters [1] ------------------- %

% Incident light

S0_i = E0_ip.^2 + E0_is.^2;
S1_i = E0_ip.^2 - E0_is.^2;
S2_i = 2 .* E0_ip .* E0_is .* cos(delta_E_is - delta_E_ip);
S3_i = 2 .* E0_ip .* E0_is .* sin(delta_E_is - delta_E_ip);


% Transmitted light

S0_t = E0_tp.^2 + E0_ts.^2;
S1_t = E0_tp.^2 - E0_ts.^2;
S2_t = 2 .* E0_tp .* E0_ts .* cos(delta_E_ts - delta_E_tp);
S3_t = 2 .* E0_tp .* E0_ts .* sin(delta_E_ts - delta_E_tp);

% ------------------ Light polarization [2] ------------------- %

% Incident

theta_i = 0.5 * atan2(S2_i, S1_i);     %azimuth, 0 ≤ θ ≤ π
psi_i = 0.5 * asin(S3_i / S0_i);       %ellipticity, -π/4 ≤ ψ ≤ π/4

% Transmitted

theta_t = 0.5 * atan2(S2_t, S1_t);     %azimuth, 0 ≤ θ ≤ π
psi_t = 0.5 * asin(S3_t / S0_t);       %ellipticity, -π/4 ≤ ψ ≤ π/4

% ------------------ Faraday Rotation (Phi) ------------------- %

Phi = 0.5*atan2(sin(2*(theta_t-theta_i)),cos(2*(theta_t-theta_i))); 
% Phi = atan2(sin(theta_t-theta_i),cos(theta_t-theta_i)); %angular difference [rad]

toc %stop timing run

end
