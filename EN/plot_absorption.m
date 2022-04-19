%% Plot absorção
function plot_absorption(freq, absorption, config, trast, color)


semilogx(freq, absorption,trast,'color',color, 'linew', 3); grid on

set(gca, 'xtick', config.plotx); set(gca,'xticklabel', config.strx); 
set(gca, 'ytick', config.ploty); set(gca,'yticklabel', config.stry); 
ylim([0 1]); xlim([config.fmin config.fmax])
xlabel('Frequency [Hz]');
ylabel('\alpha [-]')

set(gca,'fontsize', 16)