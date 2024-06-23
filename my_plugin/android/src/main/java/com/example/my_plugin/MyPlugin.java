package com.example.my_plugin;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.util.Log;

import com.neurosky.thinkgear.TGStreamReader;
import com.neurosky.thinkgear.TGStreamHandler;
import com.neurosky.thinkgear.MindDataType;
import com.neurosky.thinkgear.NskAlgoType;
import com.neurosky.thinkgear.NskAlgoSdk;
import com.neurosky.thinkgear.NskAlgoDataType;

public class MyPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;
    private TGStreamReader tgStreamReader;
    private NskAlgoSdk nskAlgoSdk;
    private short[] raw_data = new short[512];
    private int raw_data_index = 0;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "my_plugin");
        channel.setMethodCallHandler(this);

        nskAlgoSdk = new NskAlgoSdk();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("connectToHeadset")) {
            connectToHeadset();
            result.success("Connected");
        } else {
            result.notImplemented();
        }
    }

    private void connectToHeadset() {
        // Initialize and connect using Stream SDK
        tgStreamReader = new TGStreamReader(tgStreamHandler);
        tgStreamReader.connect();
    }

    private final TGStreamHandler tgStreamHandler = new TGStreamHandler() {
        @Override
        public void onStatesChanged(int connectionStates) {
            // Handle state changes
        }

        @Override
        public void onRecordFail(int flag) {
            Log.e("MyPlugin", "onRecordFail: " + flag);
        }

        @Override
        public void onChecksumFail(byte[] payload, int length, int checksum) {
            // Handle bad packets
        }

        @Override
        public void onDataReceived(int datatype, int data, Object obj) {
            // Handle received data
            switch (datatype) {
                case MindDataType.CODE_ATTENTION:
                    short[] attValue = {(short) data};
                    nskAlgoSdk.NskAlgoDataStream(NskAlgoDataType.NSK_ALGO_DATA_TYPE_ATT.value, attValue, 1);
                    break;
                case MindDataType.CODE_MEDITATION:
                    short[] medValue = {(short) data};
                    nskAlgoSdk.NskAlgoDataStream(NskAlgoDataType.NSK_ALGO_DATA_TYPE_MED.value, medValue, 1);
                    break;
                case MindDataType.CODE_POOR_SIGNAL:
                    short[] pqValue = {(short) data};
                    nskAlgoSdk.NskAlgoDataStream(NskAlgoDataType.NSK_ALGO_DATA_TYPE_PQ.value, pqValue, 1);
                    break;
                case MindDataType.CODE_RAW:
                    raw_data[raw_data_index++] = (short) data;
                    if (raw_data_index == 512) {
                        nskAlgoSdk.NskAlgoDataStream(NskAlgoDataType.NSK_ALGO_DATA_TYPE_EEG.value, raw_data, raw_data_index);
                        raw_data_index = 0;
                    }
                    break;
                default:
                    break;
            }
        }
    };

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
