function [R alpha] = reflection_and_absorption_coefficient(zs,Z0,angulo)

%Calculate reflection coefficient (R) and absorptin coefficient (alpha)
%for a given surface impedance zs.
%z0 characteristic impedance of air

%Acousic Absorbers and Diffusers, Taylor and Francis
%by Trevor Cox and Peter D'Antonio
%Eqns from chapter 1

R = (zs*cos(angulo) - Z0)./(zs*cos(angulo) + Z0);		%reflection coefficient
alpha = 1-abs(R).^2;                  %absorption coefficient

end

