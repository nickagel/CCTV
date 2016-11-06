package com.example.hambrooks.ccvt;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.net.Uri;
import android.widget.MediaController;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {
    public final static String EXTRA_MESSAGE = "com.example.CCVT.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sendToCh17(View view) {
        // Do something in response to button
        Intent intent = new Intent(this, DisplayCh17Activity.class);
        startActivity(intent);
    }

    public void sendToCh317(View view) {
        // Do something in response to button
        Intent intent = new Intent(this, DisplayCh317Activity.class);
        startActivity(intent);
    }

    public void sendToArchives(View view) {
        // Do something in response to button
        Intent intent = new Intent(this, DisplayArchivesActivity.class);
        startActivity(intent);
    }

    public void sendToSchedule(View view) {
        // Do something in response to button
        Intent intent = new Intent(this, DisplayScheduleActivity.class);
        startActivity(intent);
    }
}
