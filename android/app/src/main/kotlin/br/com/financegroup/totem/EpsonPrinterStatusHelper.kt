package br.com.financegroup.totem

import com.epson.epos2.printer.Printer

class EpsonPrinterStatusHelper {
    companion object {
        fun makeStatusMassage(type: Int) =
            when (type) {
                Printer.EVENT_ONLINE ->"ONLINE"
                Printer.EVENT_OFFLINE -> "OFFLINE"
                Printer.EVENT_POWER_OFF -> "POWER_OFF"
                Printer.EVENT_COVER_CLOSE -> "COVER_CLOSE"
                Printer.EVENT_COVER_OPEN ->"COVER_OPEN"
                Printer.EVENT_PAPER_OK -> "PAPER_OK"
                Printer.EVENT_PAPER_NEAR_END -> "PAPER_NEAR_END"
                Printer.EVENT_PAPER_EMPTY -> "PAPER_EMPTY"
                Printer.EVENT_DRAWER_HIGH -> "DRAWER_HIGH(Drawer close)"
                Printer.EVENT_DRAWER_LOW -> "DRAWER_LOW(Drawer open)"
                Printer.EVENT_BATTERY_ENOUGH -> "BATTERY_ENOUGH"
                Printer.EVENT_BATTERY_EMPTY -> "BATTERY_EMPTY"
                else -> ""
            }

    }
}