package mn.gcm.droid_prebuilt;

import android.app.Application;
import android.util.Log;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodChannel;

public class DroidPrebuiltApplication extends Application {

    private static final String FLUTTER_ENGINE_ID = "FLUTTER_ENGINE_ID";
    private static final String CHANNEL = "mn.gcm/authentication";

    MethodChannel _methodChannel;

    public int count = 0;

    private String someVariable;

    public String getSomeVariable() {
        return someVariable;
    }

    public void setSomeVariable(String someVariable) {
        this.someVariable = someVariable;
    }

    @Override
    public void onCreate() {
        super.onCreate();

        _CreateFlutterEngine();
    }

    private void _CreateFlutterEngine() {
        // Instantiate a FlutterEngine.
        FlutterEngine flutterEngine = new FlutterEngine(this);

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
                .getInstance()
                .put(FLUTTER_ENGINE_ID, flutterEngine);

        _methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);
        _methodChannel.setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("incrementCounter")) {

                        count++;
                        reportCounter();

//                        int batteryLevel = getBatteryLevel();
//
//                        if (batteryLevel != -1) {
//                            result.success(batteryLevel);
//                        } else {
//                            result.error("UNAVAILABLE", "Battery level not available.", null);
//                        }
                    } else if (call.method.equals("requestCounter")) {
                        reportCounter();
                    } else {
                        result.notImplemented();
                    }
                }
        );


    }

    private void reportCounter() {
        _methodChannel.invokeMethod("reportCounter", count);
        setSomeVariable(String.valueOf(count));
//        Log.d("Count: ", String.valueOf(count));
    }
}
