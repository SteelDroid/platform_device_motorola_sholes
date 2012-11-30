/*
 * Copyright (C) 2010 The Android Open Source Project
 */

package com.android.internal.app;

import android.app.Activity;
import android.os.Bundle;
import android.view.MotionEvent;
import android.widget.ImageView;
import android.widget.Toast;

public class PlatLogoActivity extends Activity {
    Toast mToast;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        final String text;
        final int resource;
        if (getIntent().getBooleanExtra("special", false)) {
            text = "Please donate to help expand development!";
            resource = com.android.internal.R.drawable.tdyacht;
        } else {
            text = "REAL STEEL!  NOTHING LIKE IT...EVER!";
            resource = com.android.internal.R.drawable.platlogo;
        }

        mToast = Toast.makeText(this, text, Toast.LENGTH_SHORT);

        ImageView content = new ImageView(this);
        content.setImageResource(resource);
        content.setScaleType(ImageView.ScaleType.FIT_CENTER);

        setContentView(content);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (ev.getAction() == MotionEvent.ACTION_UP) {
            mToast.show();
        }
        return super.dispatchTouchEvent(ev);
    }
}
