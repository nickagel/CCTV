package com.example.hambrooks.ccvt;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.TextView;

public class DisplayCh317Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_ch317);

        Intent intent = getIntent();
        TextView textView = new TextView(this);
        textView.setTextSize(40);
        textView.setText("317 bbq chicnked contains chicken?");

        ViewGroup layout = (ViewGroup) findViewById(R.id.activity_display_ch317);
        layout.addView(textView);
    }
}
