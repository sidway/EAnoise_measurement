%% Estimativa da imped�ncia m�dia Z_avg (ou Z_ea)
% Assume ondas planas
% Entradas:
            %hab = Fun��o transferencia entre 2 mics (pb/pa)
            %k = numero de onda
            %l = espa�amento entre microfones
            %d = distancia at� a amostra
            %ro = densidade do ar
            %co = velocidade do som no ar
% Sa�das:
            %z_avg = Componente obliqua da imped�ncia m�dia Z_avg
            %R = coeficiente de reflex�o 
            %alpha = coeficiente de absor��o
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Escrito por Sidney Volney C�ndido
% Refer�ncia: In situ measurements of surface  impedance and absorption 
% coefficients of porous materials using two microphones and ambient noise.         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
function [z_avg] = ra_pp_estimation(hab,k, l, d,ro,co)

z_avg = ro*co*((hab.*(1-exp(2*1i.*k*(l+d)))-exp(1i.*k*l).*(1-exp(2i.*k*d)))./...
(hab.*(1+exp(2*1i.*k*(l+d)))-exp(1i.*k*l).*(1+exp(2i.*k*d))));
