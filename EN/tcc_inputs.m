function [EG, f] =tcc_inputs
%Only a function that serves to optimize the space of the main routine
% General
%Analysis frequency [Hz]
EG.freq_sim =exp(log(50):0.1:log(10000))'; 
EG.freq = exp(log(80):.01:log(10000)); 

% Angular frequency [rad/s]
EG.w = 2*pi*EG.freq_sim; 
% Temperature
EG.To = 20;
% Static pressure
EG.Po = 101325; 
% Relative Humidity
EG.HR = 78; 
% Air characteristics
    [EG.rho0,EG.c0,EG.vis,EG.gam,EG.B2,EG.Cp,EG.kappla]=propair_panneton(EG.To,EG.Po,EG.HR);
% Wavenumber in air
EG.k0 = 2*pi.*EG.freq_sim/EG.c0;

% Air characteristic impedance
EG.z0 = EG.rho0*EG.c0; 
% Configure plot
f = config_plot;
EG.co = EG.c0;
        
        return

        