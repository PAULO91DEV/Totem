package br.com.financegroup.totem

import android.content.Context
import android.graphics.BitmapFactory
import android.util.Log
import com.epson.epos2.Epos2Exception
import com.epson.epos2.discovery.DeviceInfo
import com.epson.epos2.discovery.Discovery
import com.epson.epos2.discovery.FilterOption
import com.epson.epos2.printer.Printer

class EpsonPrinterManager(private val context: Context) {

    private val DISCONNECT_INTERVAL: Long = 500

    private var printer: Printer? = null
    private var deviceInfo: DeviceInfo? = null

    companion object {
        const val CALL_METHOD_INITIALIZE = "initialize"
        const val CALL_METHOD_DISCOVERY = "discovery"
        const val CALL_METHOD_CONNECT = "connect"
        const val CALL_METHOD_ADD_LOGO = "addLogo"
        const val CALL_METHOD_ADD_TEXT_ALIGN = "addTextAlign"
        const val CALL_METHOD_ADD_FEED_LINE = "addFeedLine"
        const val CALL_METHOD_ADD_TEXT = "addText"
        const val CALL_METHOD_ADD_TEXT_SIZE = "addTextSize"
        const val CALL_METHOD_ADD_BARCODE = "addBarcode"
        const val CALL_METHOD_ADD_CUT = "addCut"
        const val CALL_METHOD_CLEAR_COMMAND_BUFFER = "clearCommandBuffer"
        const val CALL_METHOD_SEND_DATA = "sendData"
        const val CALL_METHOD_DISCONNECT = "disconnect";
        const val CALL_METHOD_PRINTER_GET_STATUS = "printer_get_status";

        const val CALL_METHOD_CONNECT_PORT_ARGUMENT = "port"
        const val CALL_METHOD_ADD_TEXT_ALIGN_TYPE_ARGUMENT = "align"
        const val CALL_METHOD_ADD_TEXT_ARGUMENT = "text"
        const val CALL_METHOD_ADD_FEEDLINE_ARGUMENT = "line"
        const val CALL_METHOD_ADD_TEXT_SIZE_WIDTH_ARGUMENT = "width"
        const val CALL_METHOD_ADD_TEXT_SIZE_HEIGHT_ARGUMENT = "height"
        const val CALL_METHOD_ADD_CUT_ARGUMENT = "type"
        const val CALL_METHOD_ADD_BARCODE_ARGUMENT = "code"
        const val CALL_METHOD_TIMEOUT_ARGUMENT = "timeout"
    }

    init {
        this.initialize()
    }

    fun initialize(): Boolean {
        try {
            this.printer = Printer(Printer.TM_T88, Printer.MODEL_ANK, this.context)
            Log.d("####", "Printer success initialized!")
            return true
        } catch (e: java.lang.Exception) {
            Log.d("####", "Fail to initialize to printer TM_T88, Error: ${e.message}")
        }
        return false
    }

    fun discovery(listener: EpsonPrinterDiscoveryListener) {

        if (this.deviceInfo != null) {
            return listener.onDiscovedPrinter(this.deviceInfo!!)
        }

        val mFilterOption = FilterOption()
        mFilterOption.deviceType = Discovery.TYPE_PRINTER
        mFilterOption.epsonFilter = Discovery.FILTER_NAME
        try {
            Discovery.start(this.context, mFilterOption) { itDeviceInfo ->
                Discovery.stop()
                this.deviceInfo = itDeviceInfo
                listener.onDiscovedPrinter(itDeviceInfo)
            }
        } catch (e: Exception) {
            listener.onError("Nenhuma impressora encontrada");
        }
    }

    fun connect(port: String): Boolean {
        try {
            this.printer?.connect(port, Printer.PARAM_DEFAULT)
            Log.d("####", "Impressora conectada com sucesso!!!")
            return true
        } catch (e: java.lang.Exception) {
            Log.d("####", "Fail to connect to printer TM_T88, Error: ${e.message}")
        }
        return false
    }

    fun addLogo() {
        val logoData = BitmapFactory.decodeResource(this.context.resources, R.drawable.logo_imevo)
        this.printer?.addImage(logoData, 0, 0,
                logoData.width,
                logoData.height,
                Printer.COLOR_1,
                Printer.MODE_MONO,
                Printer.HALFTONE_DITHER,
                Printer.PARAM_DEFAULT.toDouble(),
                Printer.COMPRESS_AUTO)

    }

    fun addTextAlign(align: Int) {
        this.printer?.addTextAlign(align)
    }

    fun addFeedLine(line: Int) {
        this.printer?.addFeedLine(line)
    }

    fun addText(text: String) {
        this.printer?.addText(text)
    }

    fun addTextSize(width: Int, height: Int) {
        this.printer?.addTextSize(width, height)
    }

    fun addBarcode(code: String) {
        val barcodeWidth = 2
        val barcodeHeight = 100
        this.printer?.addBarcode(code,
                Printer.BARCODE_CODE39,
                Printer.HRI_BELOW,
                Printer.FONT_A,
                barcodeWidth,
                barcodeHeight)
    }

    fun addCut(type: Int) {
        this.printer?.addCut(type)
    }

    fun clearCommandBuffer() {
        this.printer?.clearCommandBuffer()
    }

    fun sendData(timeout: Int): Boolean {
        try {
            this.printer?.sendData(timeout)
            Log.d("####", "Send Data successfull!")
            return true
        } catch (e: java.lang.Exception) {
            Log.d("####", "Fail send data: ${e.message}")
        }
        return false
    }

    fun disconnect(): Boolean {
        while (true) {
            try {
                this.printer?.disconnect()
                Log.d("####", "Printer disconnected!")
                return true
            } catch (e: java.lang.Exception) {
                if (e is Epos2Exception) {
                    if (e.errorStatus == Epos2Exception.ERR_PROCESSING) {
                        try {
                            Thread.sleep(DISCONNECT_INTERVAL)
                        } catch (ex: java.lang.Exception) {
                        }
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }

        Log.d("####", "Printer disconnected forced!")
        this.printer?.clearCommandBuffer()
        return true
    }

    fun getStatus(listener: EpsonPrinterStatus) {
        var status = ""
        var amount = 0
        try {
            this.printer?.setStatusChangeEventListener { _, eventType ->
                val sts = EpsonPrinterStatusHelper.makeStatusMassage(eventType)
                if (status.isEmpty()) {
                    status += ","
                }
                status += sts
                amount++
                if (amount == 3) {
                    try {
                        this.printer?.stopMonitor()
                        listener.onStatus(status)
                    } catch (e: java.lang.Exception) {
                        listener.onStatus(status)
                    }
                }
            }
            this.printer?.startMonitor()
        }
        catch (e: Exception) {
            Log.d("####", "Fail to start monitor!")
            listener.onError("Fail to start monitor!")
        }
    }



    interface EpsonPrinterDiscoveryListener {
        fun onDiscovedPrinter(deviceInfo: DeviceInfo)
        fun onError(error: String)
    }

    interface EpsonPrinterStatus {
        fun onError(error: String)
        fun onStatus(status: String)
    }
}
