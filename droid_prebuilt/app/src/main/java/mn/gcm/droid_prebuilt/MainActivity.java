package mn.gcm.droid_prebuilt;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import io.flutter.embedding.android.FlutterActivity;

//import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Instantiate a FlutterEngine.
//        FlutterEngine flutterEngine = new FlutterEngine(this);
//
//        // Start executing Dart code to pre-warm the FlutterEngine.
//        flutterEngine.getDartExecutor().executeDartEntrypoint(
//                DartEntrypoint.createDefault()
//        );
//
//        // Cache the FlutterEngine to be used by FlutterActivity.
//        FlutterEngineCache
//                .getInstance()
//                .put("my_engine_id", flutterEngine);

        Button btnFlutter = findViewById(R.id.btn_flutter);

        btnFlutter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(FlutterActivity.createDefaultIntent(MainActivity.this));

//                FlutterActivity
//                        .withNewEngine()
//                        .initialRoute("/my_route")
//                        .build(currentActivity));

//                startActivity(
//                        FlutterActivity
//                                .withCachedEngine("my_engine_id")
//                                .build(currentActivity)
//                );
            }
        });
    }
}
