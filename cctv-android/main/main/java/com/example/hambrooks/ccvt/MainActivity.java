package com.example.hambrooks.ccvt;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.os.*;
import android.view.View;
import java.net.*;
import java.io.*;
import android.util.*;
import java.lang.String;
import android.widget.*;

public class MainActivity extends AppCompatActivity {
    public final static String EXTRA_MESSAGE = "com.example.CCVT.MESSAGE";
    //String x = "";
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
/* upon load of app: call localhost port 3000, (3000 changes vbased on where the app is actually hosted
load variables:
make restful call to the api, api returns info uri's archives , schedules.
anoter get for search

-get json bject
-make global variables
-click on 17
-render a live stream
 */

//        try {
//            URL url = new URL("http://www.android.com/");
//            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
//            Scanner in = new Scanner(urlConnection.getInputStream());
//            while(in.hasNext()){
//                x+=(in.next());
//                x+= "; ";
//            }
//
//        }catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            //urlConnection.disconnect();
//        }
