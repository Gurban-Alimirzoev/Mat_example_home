%Create an I2C device object
a = arduino('COM9', 'Uno', 'Libraries', 'I2C');
addrs = scanI2CBus(a);
tmp102 = device(a,'I2CAddress',addrs);

%Read temperature value
write(tmp102, 0x0, 'uint8');
data = read(tmp102, 2, 'uint8');
temperature = (double(bitshift(int16(data(1)), 4)) + double(bitshift(int16(data(2)), -4))) * 0.0625;