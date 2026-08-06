# Faraday Rotation Simulation
This is a program that simulates the angle of Faraday rotation of a magneto-optically (gyrotropic) anisotropic material, including a thin film of nanoparticles. The Faraday effect is a magneto-optical effect in which a magneto-optically active material rotates the polarization of light in the presence of a magnetic field. The required inputs are the Jones vector amplitudes for the in-plane and out-of-plane components of the light incident on and transmitted through the material. From the Jones vectors amplitudes the Stokes parameters are calculated, from which the polarization azimuth and angle of ellipticity can be determined [1, 2]. The output is the angle of Faraday rotation (φ) [rad], which is the difference in the polarization azimuth of the incident and transmitted light.

## Running the simulation
Run the function in the Get_Faraday_Rotation file, a script that returns the angle of Faraday rotation for a material or thin film of nanoparticles. For the nanoparticle thin film, the Faraday rotation of the nanoparticle is calculated as the difference between the effective Faraday rotation of the nanoparticle/substrate system and the substrate alone. 

# References
[1] H. Majeed, A. Shaheen, and M.S. Anwar, "Complete Stokes polarimetry of magneto-optical Faraday effect in a terbium gallium garnet crystal at cryogenic temperatures," Opt. Express, OE 21(21), 25148–25158 (2013).
[2] Y. Huang, H. Chen, W. Dong, F. Pang, J. Wen, Z. Chen, and T. Wang, "Fabrication of europium-doped silica optical fiber with high Verdet constant," Opt. Express, OE 24(16), 18709–18717 (2016).
