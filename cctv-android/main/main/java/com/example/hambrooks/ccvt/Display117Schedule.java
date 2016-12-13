
package com.example.hambrooks.ccvt;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class Display117Schedule extends AppCompatActivity {
    private String TAG = MainActivity.class.getSimpleName();

    private ProgressDialog pDialog;
    private ListView lv;
    public String[] s = new String[10];

    // URL to get contacts JSON
    private static String url = "http://10.0.2.2:3000/initialize";

    ArrayList<HashMap<String, String>> archivesList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display117_schedule);

        archivesList = new ArrayList<>();

        lv = (ListView) findViewById(R.id.listsvnt);

        new GetContacts().execute();
    }

    public void sendUrl(View view) {
        // Do something in response to button
        Intent intent = new Intent(this,Display117Schedule.class);
        startActivity(intent);
    }


    /**
     * Async task class to get json by making HTTP call
     */
    private class GetContacts extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(Display117Schedule.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();

            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);

            if (jsonStr != null) {
                try {
                    JSONArray ar = new JSONArray(jsonStr);

                    JSONObject jsonObj = ar.getJSONObject(2);

                    // Getting JSON Array node
                    JSONArray archives = jsonObj.getJSONArray("archives");

////                        [{str, 117[i{4str}] 317[i{4str}]} {uri's[{2str} {2str}]} {arch[i{5str}]}]

                    // looping through All Contacts
                    for (int i = 0; i < archives.length(); i++) {
                        JSONObject a = archives.getJSONObject(i);

                        String urla = a.getString("url");
                        String thumbnail = a.getString("thumbnail");
                        String title = a.getString("title");
                        String subtitle = a.getString("subtitle");
                        String airDate = a.getString("airDate");

                        s[i] = urla;


                        // tmp hash map for single contact
                        HashMap<String, String> archive = new HashMap<>();

                        // adding each child node to HashMap key => value
                        archive.put("url", urla);
                        archive.put("title", title);
                        archive.put("airDate", airDate);


                        // adding contact to contact list
                        archivesList.add(archive);
                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
                        }
                    });

                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG)
                                .show();
                    }
                });

            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();
            /**
             * Updating parsed JSON data into ListView
             * */
            ListAdapter adapter = new SimpleAdapter(
                    Display117Schedule.this, archivesList,
                    R.layout.list_svnt, new String[]{"url", "title",
                    "airDate"}, new int[]{R.id.url,
                    R.id.title, R.id.airDate});

            lv.setAdapter(adapter);
        }

    }

}


//
//    private ProgressDialog pDialog;
//    private ListView lv;
//
//    // URL to get contacts JSON
//    //private static String url = "http://api.androidhive.info/contacts/";
//    private static String url = "http://10.0.2.2:3000/initialize";
//
//    ArrayList<HashMap<String, String>>archiveList;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        archiveList = new ArrayList<>();
//
//        lv = (ListView) findViewById(R.id.listsvnt);
//
//        new GetContacts().execute();
//    }
//
//    /**
//     * Async task class to get json by making HTTP call
//     */
//    private class GetContacts extends AsyncTask<Void, Void, Void> {
//
//        @Override
//        protected void onPreExecute() {
//            super.onPreExecute();
//            // Showing progress dialog
//            pDialog = new ProgressDialog(Display117Schedule.this);
//            pDialog.setMessage("Please wait...");
//            pDialog.setCancelable(false);
//            pDialog.show();
//
//        }
//
//        @Override
//        protected Void doInBackground(Void... arg0) {
//            HttpHandler sh = new HttpHandler();
//
//            // Making a request to url and getting response
//            String jsonStr = sh.makeServiceCall(url);
//
//            Log.e(TAG, "Response from url: " + jsonStr);
//
//            if (jsonStr != null) {
//                try {
//                    JSONArray jsonAr = new JSONArray(jsonStr);
//
//
//
//                    JSONObject jsonObj = jsonAr.getJSONObject(2);
//
//                    // Getting JSON Array node
//                    JSONArray archives = jsonObj.getJSONArray("archives");
//
//                    // looping through All Contacts
//                    for (int i = 0; i < archives.length(); i++) {
//                        JSONObject a = archives.getJSONObject(i);
//
//                        String urla = a.getString("url");
//                        String thumbnail = a.getString("thumbnail");
//                        String title = a.getString("title");
//                        String subtitle = a.getString("subtitle");
//                        String airDate = a.getString("airDate");
//
//
//                        // tmp hash map for single contact
//                        HashMap<String, String> archive = new HashMap<>();
//
//                        // adding each child node to HashMap key => value
//                        archive.put("url", urla);
//                        archive.put("thumbnail", thumbnail);
//                        archive.put("title", title);
//                        archive.put("subtitle", subtitle);
//                        archive.put("airDate", airDate);
//
//                        // adding contact to contact
//                        archiveList.add(archive);
//                    }
//                } catch (final JSONException e) {
//                    Log.e(TAG, "Json parsing error: " + e.getMessage());
//                    runOnUiThread(new Runnable() {
//                        @Override
//                        public void run() {
//                            Toast.makeText(getApplicationContext(),
//                                    "Json parsing error: " + e.getMessage(),
//                                    Toast.LENGTH_LONG)
//                                    .show();
//                        }
//                    });
//
//                }
//            } else {
//                Log.e(TAG, "Couldn't get json from server.");
//                runOnUiThread(new Runnable() {
//                    @Override
//                    public void run() {
//                        Toast.makeText(getApplicationContext(),
//                                "Couldn't get json from server. Check LogCat for possible errors!",
//                                Toast.LENGTH_LONG)
//                                .show();
//                    }
//                });
//
//            }
//
//            return null;
//        }
//
//        @Override
//        protected void onPostExecute(Void result) {
//            super.onPostExecute(result);
//            // Dismiss the progress dialog
//            if (pDialog.isShowing())
//                pDialog.dismiss();
//            /**
//             * Updating parsed JSON data into ListView
//             * */
//            ListAdapter adapter = new SimpleAdapter(
//                    Display117Schedule.this, archiveList,
//                    R.layout.list_svnt, new String[]{"title", "url",
//                    "airDate"}, new int[]{R.id.start,
//                    R.id.title, R.id.length});
//
//            lv.setAdapter(adapter);
//        }
//
//    }










/***********************************************************************************/
//import android.app.ProgressDialog;
//import android.os.AsyncTask;
//import android.os.Bundle;
//import android.support.v7.app.AppCompatActivity;
//import android.util.Log;
//import android.widget.ListAdapter;
//import android.widget.ListView;
//import android.widget.SimpleAdapter;
//import android.widget.Toast;
//
//import org.json.JSONArray;
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//
//public class Display117Schedule extends AppCompatActivity {
//
//    private String TAG = Display117Schedule.class.getSimpleName();
//    private ProgressDialog pDialog;
//    private ListView lv;
//
//    // URL to get contacts JSON
//    //private static String url = "http://api.androidhive.info/contacts/";
//    private static String url = "http://10.0.2.2:3000/initialize";
//
//    ArrayList<HashMap<String, String>> scheduleList;
//    String DATE = "";
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_display117_schedule);
//
//        scheduleList = new ArrayList<>();
//
//        lv = (ListView) findViewById(R.id.listsvnt);
//
//        new GetContacts().execute();
//    }
//
//    /**
//     * Async task class to get json by making HTTP call
//     */
//    private class GetContacts extends AsyncTask<Void, Void, Void> {
//
//        @Override
//        protected void onPreExecute() {
//            super.onPreExecute();
//            // Showing progress dialog
//            pDialog = new ProgressDialog(Display117Schedule.this);
//            pDialog.setMessage("Please wait...");
//            pDialog.setCancelable(false);
//            pDialog.show();
//
//        }
//
//        @Override
//        protected Void doInBackground(Void... arg0) {
//            HttpHandler sh = new HttpHandler();
//
//            // Making a request to url and getting response
//            String jsonStr = sh.makeServiceCall(url);
//
//            Log.e(TAG, "Response from url: " + jsonStr);
//
//            if (jsonStr != null) {
//                try {
//                   // JSONObject jsonObj = new JSONObject(jsonStr);
//                    JSONArray  jsonArr = new JSONArray(jsonStr);
//
//                    //  get the first object in the json array
//                    JSONObject jsonObj = jsonArr.getJSONObject(0);
//
//                    // Get schedules array
//                    JSONArray schedules = jsonObj.getJSONArray("schedules");
//
//                    // looping through All Contacts
//                    for (int i = 0; i < schedules.length(); i++) {
//                        JSONObject s = schedules.getJSONObject(i);
//
////                        [{str, 117[i{4str}] 317[i{4str}]} {uri's[{2str} {2str}]} {arch[i{5str}]}]
//
//                        if(i==0){ DATE = s.getString("date");}
//
//                        String ch_type   = s.getString("ch_type");
//                        String endTime   = s.getString("endTime");
//                        String startTime = s.getString("startTime");
//                        String title     = s.getString("title");
//
//                        int length = Integer.parseInt(endTime)-Integer.parseInt(startTime);
//
//                        // tmp hash map for single contact
//                        HashMap<String, String> schedEntry = new HashMap<>();
//
//                        // adding each child node to HashMap key => value
//                        schedEntry.put("end_time", endTime);
//                        schedEntry.put("Start Time", startTime);
//                        schedEntry.put("Title", title);
//                        schedEntry.put("Length", Integer.toString(length));
//
//
//                        // adding contact to contact list
//                        scheduleList.add(schedEntry);
//                    }
//                } catch (final JSONException e) {
//                    Log.e(TAG, "Json parsing error: " + e.getMessage());
//                    runOnUiThread(new Runnable() {
//                        @Override
//                        public void run() {
//                            Toast.makeText(getApplicationContext(),
//                                    "Json parsing error: " + e.getMessage(),
//                                    Toast.LENGTH_LONG)
//                                    .show();
//                        }
//                    });
//
//                }
//            } else {
//                Log.e(TAG, "Couldn't get json from server.");
//                runOnUiThread(new Runnable() {
//                    @Override
//                    public void run() {
//                        Toast.makeText(getApplicationContext(),
//                                "Couldn't get json from server. Check LogCat for possible errors!",
//                                Toast.LENGTH_LONG)
//                                .show();
//                    }
//                });
//
//            }
//
//            return null;
//        }
//
//        @Override
//        protected void onPostExecute(Void result) {
//            super.onPostExecute(result);
//            // Dismiss the progress dialog
//            if (pDialog.isShowing())
//                pDialog.dismiss();
//            /**
//             * Updating parsed JSON data into ListView
//             * */
//            ListAdapter adapter = new SimpleAdapter(
//                    Display117Schedule.this, scheduleList,
//                    R.layout.list_svnt, new String[]{"Start Time", "Title",
//                    "Length"}, new int[]{R.id.start,
//                    R.id.title, R.id.length});
//
//            lv.setAdapter(adapter);
//        }
//
//    }
//}
/***********************************************************************************/
