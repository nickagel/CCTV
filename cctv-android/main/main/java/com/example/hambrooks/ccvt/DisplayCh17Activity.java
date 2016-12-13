package com.example.hambrooks.ccvt;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.TextView;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import android.util.*;

import android.net.Uri;
import android.widget.MediaController;
import android.widget.VideoView;

public class DisplayCh17Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_ch17);


        try {
            VideoView vidView = (VideoView) findViewById(R.id.myVideo);

            //  String vidAddress = "http://www.ebookfrenzy.com/android_book/movie.mp4";
            //  String vidAddress = "http://camendesign.com/code/video_for_everybody/test.html";
            //  String vidAddress = "https://archive.org/download/ksnn_compilation_master_the_internet/ksnn_compilation_master_the_internet_512kb.mp4";
            //  String vidAddress = "https://archive.org/details/Largemoviefiletest";
            //  String vidAddress = "https://media2.cctv.org/cctv/library/2016/10/DebateSundayAttorneyGeneral_F_10232016/DebateSundayAttorneyGeneral_F_10232016.broadband.mp4";
            String vidAddress = "https://media2.cctv.org/cctv/library/2016/10/DebateSundayAttorneyGeneral_F_10232016/DebateSundayAttorneyGeneral_F_10232016.broadband.mp4";

            Uri vidUri = Uri.parse(vidAddress);
            MediaController vidControl = new MediaController(this);
            vidControl.setAnchorView(vidView);
            vidView.setMediaController(vidControl);
            vidView.setVideoURI(vidUri);
            vidView.start();
        }catch(Exception e){
            Log.d("FAIL","Caught Exception");
        }




    }
}


