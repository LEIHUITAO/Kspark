#
# Copyright 2018, Cypress Semiconductor Corporation or a subsidiary of Cypress Semiconductor 
#  Corporation. All rights reserved. This software, including source code, documentation and  related 
# materials ("Software"), is owned by Cypress Semiconductor  Corporation or one of its 
#  subsidiaries ("Cypress") and is protected by and subject to worldwide patent protection  
# (United States and foreign), United States copyright laws and international treaty provisions. 
# Therefore, you may use this Software only as provided in the license agreement accompanying the 
# software package from which you obtained this Software ("EULA"). If no EULA applies, Cypress 
# hereby grants you a personal, nonexclusive, non-transferable license to  copy, modify, and 
# compile the Software source code solely for use in connection with Cypress's  integrated circuit 
# products. Any reproduction, modification, translation, compilation,  or representation of this 
# Software except as specified above is prohibited without the express written permission of 
# Cypress. Disclaimer: THIS SOFTWARE IS PROVIDED AS-IS, WITH NO  WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING,  BUT NOT LIMITED TO, NONINFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE. Cypress reserves the right to make changes to 
# the Software without notice. Cypress does not assume any liability arising out of the application 
# or use of the Software or any product or circuit  described in the Software. Cypress does 
# not authorize its products for use in any products where a malfunction or failure of the 
# Cypress product may reasonably be expected to result  in significant property damage, injury 
# or death ("High Risk Product"). By including Cypress's product in a High Risk Product, the 
#  manufacturer of such system or application assumes  all risk of such use and in doing so agrees 
# to indemnify Cypress against all liability.
#


NAME := ota_firmware_upgrade
########################################################################
# Add Application sources here.
########################################################################

APP_SRC += hci_ble_hid_dev.c
APP_SRC += hci_ble_hid_dev_db.c
APP_SRC += wiced_bt_cfg.c
APP_SRC += emr_i2c.c
APP_SRC += Count.c
APP_SRC += filemode.c
APP_SRC += crc32.c

APP_SRC += ./zlib/compress.c
APP_SRC += ./zlib/adler32.c
APP_SRC += ./zlib/trees.c
APP_SRC += ./zlib/inftrees.c
APP_SRC += ./zlib/inflate.c
APP_SRC += ./zlib/inffast.c
APP_SRC += ./zlib/uncompr.c

APP_SRC += hci_ble_password.c
APP_SRC += Hallswitch.c
APP_SRC += RTC.c
APP_SRC += GpioExtend.c
APP_SRC += STCControl.c
APP_SRC += ./fatfs/fat.c
APP_SRC += ./fatfs/diskio.c
APP_SRC += ./fatfs/flash.c
APP_SRC += ./uart/uart.c
APP_SRC += ./uart/uart_fifo.c
APP_SRC += ./uart/mcu_update.c
APP_SRC += ./emr_action/emr_data_zip.c
APP_SRC += ./emr_action/emr_led.c
#APP_SRC += ./emr_action/emr_btn_xy.c
APP_SRC += ./emr_action/emr_ex_time.c
APP_SRC += user_data_init.c
APP_SRC += link_pairing.c
APP_SRC += ./time/date_time.c
APP_SRC += ./debug/app_debug.c
APP_SRC += ./hci/hci_control.c
APP_SRC += ./power_mode/low_power_mode.c
APP_SRC += FlashBadBlockManagement.c
########################################################################
# Component(s) needed
########################################################################
$(NAME)_COMPONENTS := fw_upgrade_lib.a

########################################################################
# C flags
########################################################################
C_FLAGS += -DWICED_BT_TRACE_ENABLE

 # Enable Audio
ifeq ($(ENABLE_AUDIO), y)
APP_SRC += hci_ble_hid_dev_audio.c
APP_SRC += hw_timer.c
C_FLAGS += -DAUDIO_SUPPORT
endif

########################################################################
################ DO NOT MODIFY FILE BELOW THIS LINE ####################
########################################################################
include $(COMMON_APP_MAKE)