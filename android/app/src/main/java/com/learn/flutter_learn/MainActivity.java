package com.learn.flutter_learn;

import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        MethodChannel channel = new MethodChannel(flutterEngine.getDartExecutor(), "nativeCall");
        channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if (call.method.equals("increment")) {
                    int count = call.argument("count");
                    result.success(count + 1);
                }
                if (call.method.equals("callFlutterMethod")) {
                    channel.invokeMethod("getFlutterContent", null, new MethodChannel.Result() {
                        @Override
                        public void success(@Nullable Object result) {
                            Log.i("FlutterLearning", "--------getFlutterContent:  " + result + "--------");
                        }

                        @Override
                        public void error(@NonNull String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {
                            Log.e("FlutterLearning", "------getFlutterContent error: " + errorMessage);
                        }

                        @Override
                        public void notImplemented() {

                        }
                    });
                }
            }
        });
    }
}
