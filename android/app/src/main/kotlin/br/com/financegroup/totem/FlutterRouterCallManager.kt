package br.com.financegroup.totem

import android.app.Activity
import android.content.Context
import android.util.Log
import com.epson.epos2.discovery.DeviceInfo
import com.google.gson.Gson
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FlutterRouterCallManager(private val activity: Activity) {
    private val epsonPrinterManager = EpsonPrinterManager(this.activity)

    fun route(context: Context, call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            EpsonPrinterManager.CALL_METHOD_INITIALIZE -> processInitilizePrinter(call, result)
            EpsonPrinterManager.CALL_METHOD_DISCOVERY -> processDiscoveryPrinter(call, result)
            EpsonPrinterManager.CALL_METHOD_CONNECT -> processConnectToPrinter(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_LOGO -> processAddLogo(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_TEXT_ALIGN -> processAddTextAlign(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_FEED_LINE -> processAddFeedLine(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_TEXT -> processAddText(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_TEXT_SIZE -> processAddTextSize(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_BARCODE -> processAddBarcode(call, result)
            EpsonPrinterManager.CALL_METHOD_ADD_CUT -> processAddCut(call, result)
            EpsonPrinterManager.CALL_METHOD_CLEAR_COMMAND_BUFFER -> processClearCommandBuffer(call, result)
            EpsonPrinterManager.CALL_METHOD_SEND_DATA -> processSendData(call, result)
            EpsonPrinterManager.CALL_METHOD_DISCONNECT -> processDisconnect(call, result)
            EpsonPrinterManager.CALL_METHOD_PRINTER_GET_STATUS -> processPrinterGetStatus(call, result)
            else -> result.notImplemented()
        }

    }

    private fun processDiscoveryPrinter(call: MethodCall, result: MethodChannel.Result) {
        epsonPrinterManager.discovery(object : EpsonPrinterManager.EpsonPrinterDiscoveryListener {
            override fun onDiscovedPrinter(deviceInfo: DeviceInfo) {
                Log.d("####", "DeviceName: ${deviceInfo.deviceName}")
                activity.runOnUiThread {
                    result.success(Gson().toJson(deviceInfo))
                }
            }

            override fun onError(error: String) {
                result.error("UNAVAILABLE", "Cannot find the printer", null)
            }
        })
    }

    private fun processInitilizePrinter(call: MethodCall, result: MethodChannel.Result) {
        if (epsonPrinterManager.initialize()) {
            result.success(true)
        } else {
            result.error("INIT_ERROR", "Cannot initialized printer", null)
        }
    }

    private fun processConnectToPrinter(call: MethodCall, result: MethodChannel.Result) {
        call.argument<String>(EpsonPrinterManager.CALL_METHOD_CONNECT_PORT_ARGUMENT)?.let {
            if (this.epsonPrinterManager.connect(it)) {
                result.success(true)
            } else {
                result.error("CONNECT_ERROR", "Cannot connect to printer", null)
            }
        } ?: result.error("CONNECT_PORT_ERROR", "Invalid connect port", null)
    }

    private fun processAddLogo(call: MethodCall, result: MethodChannel.Result) {
        this.epsonPrinterManager.addLogo()
        result.success(true)
    }

    private fun processAddTextAlign(call: MethodCall, result: MethodChannel.Result) {
        call.argument<Int>(EpsonPrinterManager.CALL_METHOD_ADD_TEXT_ALIGN_TYPE_ARGUMENT)?.let {
            this.epsonPrinterManager.addTextAlign(it)
            result.success(true)
        } ?: result.error("ADD_TEXT_ALIGN_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processAddFeedLine(call: MethodCall, result: MethodChannel.Result) {
        call.argument<Int>(EpsonPrinterManager.CALL_METHOD_ADD_FEEDLINE_ARGUMENT)?.let {
            try {
                this.epsonPrinterManager.addFeedLine(it)
                result.success(true)
            } catch (t: Throwable) {
                result.error("ADD_FEEDLINE_ERROR", "Cannot add feedline to printer", null)
            }
        } ?: result.error("ADD_FEEDLINE_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processAddText(call: MethodCall, result: MethodChannel.Result) {
        call.argument<String>(EpsonPrinterManager.CALL_METHOD_ADD_TEXT_ARGUMENT)?.let {
            this.epsonPrinterManager.addText(it)
            result.success(true)
        } ?: result.error("ADD_TEXT_ALIGN_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processAddTextSize(call: MethodCall, result: MethodChannel.Result) {
        call.argument<Int>(EpsonPrinterManager.CALL_METHOD_ADD_TEXT_SIZE_WIDTH_ARGUMENT)?.let { itWidth ->
            call.argument<Int>(EpsonPrinterManager.CALL_METHOD_ADD_TEXT_SIZE_HEIGHT_ARGUMENT)?.let { itHeight ->
                this.epsonPrinterManager.addTextSize(itWidth, itHeight)
                result.success(true)
            }
                    ?: result.error("ADD_TEXT_SIZE_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
        } ?: result.error("ADD_TEXT_SIZE_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processAddCut(call: MethodCall, result: MethodChannel.Result) {
        call.argument<Int>(EpsonPrinterManager.CALL_METHOD_ADD_CUT_ARGUMENT)?.let {
            this.epsonPrinterManager.addCut(it)
            result.success(true)
        } ?: result.error("ADD_CUT_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processAddBarcode(call: MethodCall, result: MethodChannel.Result) {
        call.argument<String>(EpsonPrinterManager.CALL_METHOD_ADD_BARCODE_ARGUMENT)?.let {
            this.epsonPrinterManager.addBarcode(it)
            result.success(true)
        } ?: result.error("ADD_BARCODE_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processClearCommandBuffer(call: MethodCall, result: MethodChannel.Result) {
        this.epsonPrinterManager.clearCommandBuffer()
        result.success(true)
    }

    private fun processSendData(call: MethodCall, result: MethodChannel.Result) {
        call.argument<Int>(EpsonPrinterManager.CALL_METHOD_TIMEOUT_ARGUMENT)?.let {
            if (this.epsonPrinterManager.sendData(it)) {
                result.success(true)
            } else {
                result.error("SEND_DATA_ERROR", "Cannot send data to printer", null)
            }
        } ?: result.error("SEND_DATA_INVALID_PARAMETER_ERROR", "Invalid parameter error", null)
    }

    private fun processDisconnect(call: MethodCall, result: MethodChannel.Result) {
        if (this.epsonPrinterManager.disconnect()) {
            result.success(true)
        } else {
            result.error("DISCONNECT_ERROR", "Cannot disconnect printer", null)
        }
    }

    private fun processPrinterGetStatus(call: MethodCall, result: MethodChannel.Result) {
        this.epsonPrinterManager.getStatus(object: EpsonPrinterManager.EpsonPrinterStatus {
            override fun onError(error: String) {
                result.error("PRINTER_GET_STATUS_ERROR", "Fail to get printer status!", null)
            }

            override fun onStatus(status: String) {
                result.success(status)
            }
        })
    }
}