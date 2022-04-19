%% In-situ surface impedance measurement
%%%%%%%%%%%%%%%%%%%%%
% Sidney V. Cândido 
% 2022 
 
set(groot, 'defaultLegendInterpreter','latex');
close all
%Change m_path to the save master folder
m_path = '';
%% 1. entries
%IMPORTANT TO CHANGE filename_dot_m  for each time you run the code
filename_dot_m = 'ressonator-A1-001';
%Plot settings and frequency vectors, wave number
[input, f] = tcc_inputs;
%experiment parameters                      
l = 18/1000; % distance between micrhofones, intrinsic of the apparatus
d = 10/1000; % Distance from the nearest mic to the sample  
% Air properties
To=25; %[Celsius]
Po=101300; % [Pa]
RH=69; % Relative Humidity[percent
day = date;
mkdir (day)
% Sound speed and air density calculation
[rho,co,~,~,~,~]=propair_panneton(To,Po,HR); clear To Po HR
coord.r = 4; % Distance from the source to the center of the sample [m]
coord.mic1 = [0 0 l+d]; % Coordinate of mic 1 [m]
coord.mic2 = [0 0 0 d]; % Coordinate of mic 2 [m]
%Processing
Fs = 44100; % sampling rate [Hz]
nfft = Fs; % Number of FFT points [-]
avg = 15; % Number of averages [-]
jan = hann(nfft/(0.5*(avg))); % Window size (nfft/n_med*overlap)[-]

%% Measures with ITA
[CI, med_1, med_2] = mesuare_tf_ita(fs ,20);     

%Processing measurements
% FT of normal measurement
[hab_n ,freq] = tfestimate(med_1.timeVector(:,1), med_1.timeVector2(:,2)...
    ,jan,[],nfft,Fs);
% % FT of the measurement with inverted mics
[hab_inv ,~] = tfestimate(med_2.timeVector(:,1), med_2.timeVector2(:,2),...
    jan,[],nfft,Fs);

% invert microphones to normal position again before restart
% measurement
%% Plot Transfer Function
hm = smooth(hab_n.^.5./hab_inv.^.5,30);
TF = figure('name', 'Transfer Function');
set(gcf, 'Position', get(0, 'Screensize'));
semilogx(freq, hm, '-'); hold on
semilogx(freq, hab_n, '-'); hold on
semilogx(freq, hab_inv, '-'); hold on

%% Impedance recovery
% Wavenumber the frequency vector processed in tfestimate
k0 = 2*pi*freq/co;
%Deduction of surface impedance (plane waves, ambient noise)
[z_avg] = ra_pp_estimation(hm,k0, l, d,rho,co);
% absorption
[~, alpha] = reflection_and_absorption_coefficient(z_avg,rho*co,0);

%% Save data
data.freq_narrow = freq;
data.alpha_narrow = alpha;
data.impedance_narrow = z_avg;
data.med_1 = med_1;
data.med_2 = med_2;
data.config_plot = f;
data.transfer = hm;
data.date = day;
data.l = l;
data.d = d;
data.Fs = Fs;
data.nfft = nfft;
data.avg = avg;

save([m_path '\med_' filename_dot_m], 'data')

%% Plot Impedance
filename = ['Impedance ' filename_dot_m];
plot_impedance(data.freq_narrow, data.impedance_narrow/(rho*co),...
    data.config_plot,'--',[1 1 0.45]); hold on
savefig(filename)
%% Plot absorption
f.fmin = 100;
f.fmax = 5000;
filename = ['Absorption ' filename_dot_m] ;
fig = figure('position', [50 50 800 600]);
plot_absorption(data.freq_narrow, data.alpha_narrow, data.config_plot,...
    '-', [0.5 0.5 0.5]); hold on
%savefig(filename)
% save_as_pdf (filename, fig)
% save(filename_dot_m,'data')