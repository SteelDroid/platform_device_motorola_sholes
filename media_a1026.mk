# Copyright (C) 2009 The Android Open Source Project

# This file describes the use of the A1026 chip by the media
# framework using system properties.
#
# Note:    The property key and value has some length
#          limit as defined by PROPERTY_KEY_MAX and
#          PROPERTY_VALUE_MAX, respectively
#
# WARNING: We may not use system properties for specifying
#          media capabilities and profiles in the future
PRODUCT_PROPERTY_OVERRIDES += \
      media.a1026.nsForVoiceRec            = 0 \
      media.a1026.enableA1026              = 1
