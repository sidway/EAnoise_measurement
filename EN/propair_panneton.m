function [ro,co,vis,gam,B2,Cp,kappla]=propair_panneton(To,Po,HR) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes properties of humid air.
%
% Programmed by: Prof. Raymond Panneton, Eng., Ph.D.
% Version: 4
% Date: August 2010
% (c) Université de Sherbrooke
%
% PREFERRED REFERENCE:
% 1-	For dynamic viscosity:
%		Lide, D. R. and Kehiaian H. V.,
%		"CRC Handbook of Thermophysical and Thermochemical Data",
%		CRC Press Inc, 1994
% 2-	For specific heat at constant pressure:
%		Touloukian, Y. S. and Makita, T.,
%		"Specific Heat - Non metallic Liquids and gases",
%		The TPRC Data Series, Volume 6, IFI/PLENUM, 1970
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input parameters:
%   -To: temperature in Celsius (C)
%   -Po: atmospheric pressure in Pascal (Pa)
%   -HR: relative humidity in percentage (%)
%
% Output parameters:
%   -ro: volume density (kg/m³)
%   -co: sound speed (m/s)
%   -vis: absolute (or dynamic) viscosity in Ns/m²
%   -gam: specific heat ratio (no units)
%   -B2: Prandtl number (no units)
%   -Cp: Constant Pressure Spectfic Heat in J/kg·K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kappla=0.026;           %air thermal condutivity W/(m·K)
T=To+273.16;
B2=0.71;				% Prandtl number (fewly varies at typical air conditions (0°C=0.715; 60°C=0.709).
R=287.031;			    % Gas constant for air (J/K/kg)
Rvp=461.521;		    % Gas constant for water vapor (J/K/kg)
Pvp = 0.0658*T.^3 - 53.7558*T.^2+ 14703.8127*T-1345485.0465;    % Pierce (Acoustics, 1991) page 555
vis=7.72488e-8*T-5.95238e-11*T.^2+2.71368e-14*T.^3;
Cp=4168.8*(0.249679-7.55179e-5*T+1.69194e-7*T.^2-6.46128e-11*T.^3);
Cv=Cp-R;				% Constant Volume Specific Heat (J/kg/K) for 260 K < T < 600 K
B2=vis.*Cp./kappla;
gam=Cp./Cv;			    
ro=Po./(R*T)-(1/R-1/Rvp).*HR/100*Pvp./T;
co=(gam.*Po./ro).^0.5;  % Sound speed in air (m/s)



return

