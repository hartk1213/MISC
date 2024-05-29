#!/bin/bash

# Waveshare 2.8 Installation with Klipperscreen

# Step 1: Clone Waveshare-DSI-LCD driver repo
echo "Cloning Waveshare-DSI-LCD driver repository..."
cd ~
git clone https://github.com/waveshare/Waveshare-DSI-LCD && cd Waveshare-DSI-LCD

# Step 2: Find the kernel version and system architecture
echo "Checking system kernel version and architecture..."
KERNEL_INFO=$(uname -m -r)
echo "Kernel info: $KERNEL_INFO"

# Extract kernel version and architecture
KERNEL_VERSION=$(echo $KERNEL_INFO | awk '{print $1}')
ARCHITECTURE=$(echo $KERNEL_INFO | awk '{print $2}')

# Determine if the system is 32bit or 64bit
if [[ $ARCHITECTURE == *"aarch64"* ]]; then
  SYS_DIR="64"
else
  SYS_DIR="32"
fi

# Step 3: Navigate to the appropriate directory
echo "Navigating to the appropriate driver directory..."
cd $KERNEL_VERSION/$SYS_DIR

# Step 4: Install the drivers
echo "Installing the drivers..."
sudo bash ./WS_xinchDSI_MAIN.sh 28 I2C0

# Step 5: Add 90-monitor.conf file
echo "Adding 90-monitor.conf file..."
sudo mkdir -p /usr/share/X11/xorg.conf.d/
sudo wget -P /usr/share/X11/xorg.conf.d/ https://raw.githubusercontent.com/hartk1213/MISC/main/Voron%20Mods/Voron%200/0.2/2_8WaveshareDisplay/Software/90-monitor.conf

# Step 6: Update /boot/config.txt
echo "Updating /boot/config.txt..."
sudo sh -c 'echo "\
dtoverlay=vc4-kms-v3d\n\
dtoverlay=vc4-kms-dsi-waveshare-panel,2_8_inch\n\
dtoverlay=WS_xinchDSI_Screen,SCREEN_type=0,I2C_bus=10\n\
dtoverlay=WS_xinchDSI_Touch,I2C_bus=10,invertedy,invertedx" >> /boot/config.txt'

# Step 7: Reboot the system
echo "Rebooting the system..."
sudo reboot