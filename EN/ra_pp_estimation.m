%% Estimativa da impedância média Z_avg (ou Z_ea)
% Assume ondas planas
% Entradas:
            %hab = Função transferencia entre 2 mics (pb/pa)
            %k = numero de onda
            %l = espaçamento entre microfones
            %d = distancia até a amostra
            %ro = densidade do ar
            %co = velocidade do som no ar
% Saídas:
            %z_avg = Componente obliqua da impedância média Z_avg
            %R = coeficiente de reflexão 
            %alpha = coeficiente de absorção
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Escrito por Sidney Volney Cândido
% Referência: In situ measurements of surface  impedance and absorption 
% coefficients of porous materials using two microphones and ambient noise.         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
function [z_avg] = ra_pp_estimation(hab,k, l, d,ro,co)

z_avg = ro*co*((hab.*(1-exp(2*1i.*k*(l+d)))-exp(1i.*k*l).*(1-exp(2i.*k*d)))./...
(hab.*(1+exp(2*1i.*k*(l+d)))-exp(1i.*k*l).*(1+exp(2i.*k*d))));
