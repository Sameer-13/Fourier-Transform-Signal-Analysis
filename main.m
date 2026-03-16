clear all
LineWidth = 3; FontSize = 14;

% Asking user to enter inputs
type = input("Enter (1) Rectangular, (2) Triangular, (3) Cosine:");
A = input("Amplitude A (volts) = ");
Taw = input("Taw parameter (sec) = ");
sample_per_taw = input("Number of time samples per Taw = ");
sample_per_hz = input("Number of freq samples per Hz = ");

t = -Taw: (1/sample_per_taw) :Taw; % define time axis
f = -3/Taw: 1/sample_per_hz: 3/Taw; % define freq axis

switch type
% Generate rectangular pulse using rectpuls
case 1
    disp('Rectangular pulse');

    P_t =  A* rectpuls(t, Taw);  % rectpuls creates a rectangular pulse centered at 0
    P_f =  @(f) A*Taw*sin(pi*Taw*f)./(pi*Taw*f); % The corresponding F.T P(f)
    
    firstZero_neg = -1/Taw; 
    firstZero_pos = 1/Taw; 

    Total_Energy = A.^2 * (Taw/2 + Taw/2); % calculating the energy.

    polt1_title = 'rectangular pulse - time domain';
    polt2_title = 'rectangular pulse - frequency domain';

% Triagular symmetric pulse – width = 2Taw
case 2
    disp('Triangular pulse');

    P_t =  A*tripuls(t/2*Taw);  % triang creates a normalized triangular pulse
    P_f = @(f) A*Taw.*(sin(pi*Taw*f)./(pi*Taw*f)).^2; % The corresponding F.T P(f)

    firstZero_neg = -1/Taw; 
    firstZero_pos = 1/Taw; 

    Total_Energy = (A.^2 * (2*Taw))/3; % calculating the energy.

    polt1_title = 'triagular pulse - time domain';
    polt2_title = 'triagular pulse - frequency domain';

% Cosine symmetric pulse - width = Taw
case 3
    disp('Cosine pulse')

    P_t = zeros(size(t));
    int = t >= -Taw/2 & t <= Taw/2; % for identifing the interval of cosine function
    P_t(int) = A*cos((pi*t(int))/Taw); % The Cosine pulse of height A and width Taw
    P_f = @(f) ((2*A*Taw)/pi) * (cos(pi*f*Taw)/(1-(2*f*Taw).^2)); % The corresponding F.T P(f)
    
    firstZero_neg = -3/(2*Taw);
    firstZero_pos = 3/(2*Taw);

    Total_Energy = (A.^2 * Taw)/2 % calculating the total energy.

    polt1_title = 'cosine pulse - time domain';
    polt2_title = 'cosine pulse - frequency domain';

otherwise
    error('Invalid pulse type'); % Handle unexpected input
end

% Plotting the practical zeros
fprintf('Practical BW from: %f Hz to %f Hz\n', firstZero_neg, firstZero_pos);

% Plotting the total energy
fprintf('Total energy: %f Joules\n', Total_Energy); % printing the energy

% Calculating the ESDF
ESDF_f = @(f) P_f(f).*conj(P_f(f)); % The ESDF
ESDF_F_Array = arrayfun(ESDF_f, f); % Calculate ESDF for each frequency for plotting

% Ploting the pulse in the time domain
figure(1);
h = plot(t, P_t,  'LineWidth', LineWidth);
xlabel('time (sec)', 'FontSize', FontSize);
ylabel('p(t) volts', 'FontSize', FontSize);
title(polt1_title, 'FontSize', FontSize);
grid on;

% Plot the ESDF in the frequency domain
figure(2);
plot(f, ESDF_F_Array, 'LineWidth', LineWidth); 
xlabel('frequency (Hz)', 'FontSize', FontSize);
ylabel('ESDF (Joules/Hz)', 'FontSize', FontSize);
title(polt2_title, 'FontSize', FontSize);
grid on;