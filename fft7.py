import numpy as np
import matplotlib.pyplot as plt
from astropy.io import fits


# Read lightcurve
output = input("Enter file name: ")
hdul = fits.open(output)
data = hdul['LIGHTCURVE',1].data
dt = data.field(2)
rate = data.field('NET_RATE')

# Compute the one-dimensional discrete Fourier Transform.

fft_wave = np.fft.rfft(rate)

# Calculate power

abs_fft_wave = np.abs(fft_wave)

power_spectrum = np.square(abs_fft_wave)

frequency = np.linspace(0, 1/(2*(dt[1]-dt[0])), len(power_spectrum))

# Plot

plt.subplot(2,1,1)
plt.plot(frequency, power_spectrum)
plt.xlabel("frequency (Hz)")

plt.subplot(2,1,2)
plt.plot(dt, rate)
plt.xlabel("time (s)")

plt.show()
