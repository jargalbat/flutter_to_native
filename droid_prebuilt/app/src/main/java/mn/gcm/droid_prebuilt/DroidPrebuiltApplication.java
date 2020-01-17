package mn.gcm.droid_prebuilt;

import android.app.Application;
import android.util.Log;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodChannel;

public class DroidPrebuiltApplication extends Application {


    @Override
    public void onCreate() {
        super.onCreate();

        _CreateFlutterEngine();
    }

    MethodChannel _methodChannel;

    public int count = 0;
    private String someVariable;

    public String getSomeVariable() {
        return someVariable;
    }

    public void setSomeVariable(String someVariable) {
        this.someVariable = someVariable;
    }

    private void _CreateFlutterEngine() {
        final String FLUTTER_ENGINE_ID = "FLUTTER_ENGINE_ID";
        final String CHANNEL = "mn.gcm/authentication";

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
                        _methodChannel.invokeMethod("reportCounter", count);
                        setSomeVariable(String.valueOf(count));
//                    } else if (call.method.equals("requestCounter")) {
//                        String str = call.arguments.toString();
//
//                        //_methodChannel.invokeMethod("reportCounter", count);
//                        setSomeVariable("failed");
//
//                        setSomeVariable(String.valueOf(count));
                    } else if (call.method.equals("success")) {
                        String str = call.arguments.toString();

                        setSomeVariable(str);


                    } else if (call.method.equals("failed")) {
                        setSomeVariable("failed");
                    } else {
                        result.notImplemented();
                    }

                }
        );
    }
}
