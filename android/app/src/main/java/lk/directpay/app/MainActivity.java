package lk.directpay.app;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.system.Os;
import android.util.Log;

import androidx.annotation.NonNull;

import com.darvin.security.IIsolatedService;

import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {

    private static final String CHANNEL = "security.app/tools";
    private static final String TAG = "MainActivity";

    private IIsolatedService serviceBinder;
    private boolean bServiceBound;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler((call, result) -> {
            if (call.method.equals("checkForRoot")) {
                Log.d(TAG, "configureFlutterEngine: method - " + call.method);
                boolean bIsMagisk = false;
                if (bServiceBound) {
                    try {
                        Log.d(TAG, "UID:" + Os.getuid());
                        bIsMagisk = serviceBinder.isMagiskPresent();
                    } catch (RemoteException e) {
                        e.printStackTrace();
                    }
                } else {
                    Log.d(TAG, "configureFlutterEngine: Isolated Service not bound");
                }
                result.success(bIsMagisk);
            }
        });
    }

    @Override
    protected void onStart() {
        super.onStart();
        Intent intent = new Intent(getApplicationContext(), IsolatedService.class);
        /*Binding to an isolated service */
        getApplicationContext().bindService(intent, mIsolatedServiceConnection, BIND_AUTO_CREATE);
    }

    private final ServiceConnection mIsolatedServiceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            serviceBinder = IIsolatedService.Stub.asInterface(iBinder);
            bServiceBound = true;
            Log.d(TAG, "Service bound");
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            bServiceBound = false;
            Log.d(TAG, "Service Unbound");
        }
    };
}
