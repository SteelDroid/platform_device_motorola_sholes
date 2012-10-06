/*
 * Copyright (C) 2008 The Android Open Source Project
 */

#ifndef ANDROID_LIS_SENSOR_H
#define ANDROID_LIS_SENSOR_H

#include <stdint.h>
#include <errno.h>
#include <sys/cdefs.h>
#include <sys/types.h>

#include "nusensors.h"
#include "SensorBase.h"
#include "InputEventReader.h"

/*****************************************************************************/

struct input_event;

class LisSensor : public SensorBase {
public:
            LisSensor();
    virtual ~LisSensor();

    virtual int setDelay(int32_t handle, int64_t ns);
    virtual int enable(int32_t handle, int enabled);
    virtual int readEvents(sensors_event_t* data, int count);
    void processEvent(int code, int value);

    int setInitialState();

private:
    uint32_t mEnabled;
    InputEventCircularReader mInputReader;
    sensors_event_t mPendingEvent;
};

/*****************************************************************************/

#endif  // ANDROID_AKM_SENSOR_H
