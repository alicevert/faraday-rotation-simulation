% Last Updated: 2026-07-30 by Alice Calvert
% This is a script that simulates the Faraday Rotation (Phi) [rad] of a material 
% from the polarization azimuths of the incident and transmitted light.
% The Faraday Rotation of thin-films of nanoparticles is derived from the difference 
% of the substrate/layer/nanoparticles's Phi from the substrate/layer's Phi.
% See the Faraday_Rotation_Simulation file for more details on the inputs.

% ------------------------------------------------------------- %
% ----------------------- Initialization ---------------------- %
% ------------------------------------------------------------- %

clc 
clear

while true
    is_nanoparticle = input('Is the material a thin-film of nanoparticles? ("yes" or "no"):', 's');
    if strcmpi(is_nanoparticle, 'yes')
        fprintf('Calculating Faraday rotation of substrate/layer *without* nanoparticles...\n');
        break;
    elseif strcmpi(is_nanoparticle, 'no')
        fprintf('Calculating Faraday rotation of material...\n');
        break;
    else
        fprintf('Invalid input. Please enter "yes" or "no".\n\n');
    end
end

% Testing
% [Phi]=Faraday_Rotation_Simulation(0,1.1596E8+1.1095E8i,-1.1952E-9+1.6922E-9i,1.9800E7-2.8019E7i)
% [Phi_tot]=Faraday_Rotation_Simulation(0,1.1596E8+1.1095E8i,-1.1941E-9+1.6899E-9i,1.9781E7-2.7981E7i)

% ------------------------------------------------------------- %
% ---------------- Faraday Rotation Calculation --------------- %
% ------------------------------------------------------------- %
 
% Material or substrate/layer

jiip = input('Enter the *incident* Jones Vector amplitude, *in-plane* component:');
jioop = input('Enter the *incident* Jones Vector amplitude, *out-of-plane* component:');

jtip = input('Enter the *transmitted* Jones Vector amplitude, *in-plane* component:');
jtoop = input('Enter the *transmitted* Jones Vector amplitude, *out-of-plane* component:');

[Phi]=Faraday_Rotation_Simulation(jiip,jioop,jtip,jtoop)

if strcmpi(is_nanoparticle, 'no')
    fprintf('Faraday rotation angle is %f rad.', Phi)

% Substrate/layer/nanoparticles

elseif strcmpi(is_nanoparticle, 'yes')

    fprintf('Calculating Faraday rotation of substrate/layer *with* nanoparticles...\n');

    jiip_tot = input('Enter the *incident* Jones Vector amplitude, *in-plane* component:');
    jioop_tot = input('Enter the *incident* Jones Vector amplitude, *out-of-plane* component:');

    jtip_tot = input('Enter the *transmitted* Jones Vector amplitude, *in-plane* component:');
    jtoop_tot = input('Enter the *transmitted* Jones Vector amplitude, *out-of-plane* component:');

    [Phi_tot]=Faraday_Rotation_Simulation(jiip_tot,jioop_tot,jtip_tot,jtoop_tot)

    Phi_nanoparticles = Phi_tot - Phi

    fprintf('Faraday rotation angle is %f rad.', Phi_nanoparticles);

end
