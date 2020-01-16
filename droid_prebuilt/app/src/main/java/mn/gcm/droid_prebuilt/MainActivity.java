package mn.gcm.droid_prebuilt;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {

    TextView lblCount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        lblCount = findViewById(R.id.lblCount);

        Button btn_a = findViewById(R.id.btn_a);
        btn_a.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Option A
                startActivity(FlutterActivity.createDefaultIntent(MainActivity.this));
            }
        });

        Button btn_b = findViewById(R.id.btn_b);
        btn_b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(FlutterActivity
                        .withCachedEngine("FLUTTER_ENGINE_ID")
                        .build(MainActivity.this));
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();

        // set
//        ((DroidPrebuiltApplication) this.getApplication()).setSomeVariable("foo");

// get
        String s = ((DroidPrebuiltApplication) this.getApplication()).getSomeVariable();
//        val app = application as DroidPrebuiltApplication;
        lblCount.setText(s);
    }
}
