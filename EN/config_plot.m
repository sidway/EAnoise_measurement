function f = config_plot
% Configuração
    %==% Eixo x
    f.plotx=[50, 100, 200, 500, 1000, 2000, 4000, 6000, 10000, 16000]; 
    A = sep_convert(f.plotx,'%5.0f','virgula',0); B = sep_convert(f.plotx,'%5.0f','virgula',1);
    f.strx = [A(1:4) B(5:end)]; clear A B;
    %==% Eixo y
    f.ploty=[0.0 0.2, 0.4, 0.6, 0.8, 1.00]; 
    A = sep_convert(f.ploty,'%5.2f','virgula',0); 
    f.stry = A; clear A
    return
