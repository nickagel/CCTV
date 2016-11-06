package com.example.hambrooks.ccvt;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.VideoView;
import android.net.Uri;
import android.widget.MediaController;
public class DisplayCh17Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_ch17);

        Intent intent = getIntent();
        TextView textView = new TextView(this);
        textView.setTextSize(40);
        textView.setText("17 I HEART chocolate");

        ViewGroup layout = (ViewGroup) findViewById(R.id.activity_display_ch17);
        layout.addView(textView);


    }
}


//    VideoView vidView = (VideoView)findViewById(R.id.myVideo);
//
//    String vidAddress = "https://archive.org/download/ksnn_compilation_master_the_internet/ksnn_compilation_master_the_internet_512kb.mp4";
//    Uri vidUri = Uri.parse(vidAddress);
//     vidView.setVideoURI(vidUri);
//
//        MediaController vidControl = new MediaController(this);
//        vidControl.setAnchorView(vidView);
//        vidView.setMediaController(vidControl);
//        vidView.start();