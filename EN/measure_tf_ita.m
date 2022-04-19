%% Medição
function [CI, med_1, med_2] = measure_tf_ita(fs ,fft)

    % Creating the measurement variable and configuring
    CI = itaMSRecord;
    %S ampling frequency
    CI.samplingRate=fs; 
    % Parameter related to the time of the measurement
    CI.fftDegree=fft;
    % Number of inputs
    CI.inputChannels= [1 2];
    % Running measurement

    input('Turn speakers on a least 1.5 m distance of the sample. \n press ENTER')
    % Medição 1
    med_1 = CI.run;

    input('Invert microphones. \n press ENTER.')
    % medição 2: Microfones invertidos
    med_2 = CI.run;
end
