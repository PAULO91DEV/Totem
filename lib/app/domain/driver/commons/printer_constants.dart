const kPrinterAlignLeft = 0;
const kPrinterAlignCenter = 1;
const kPrinterAlignRight = 2;

const kPrinterCutNoFeed = 0;
const kPrinterCutFeed = 1;
const kPrinterCutReserve = 2;

const kPrinterParamUnspecified = -1;
const kPrinterParamDefault = -2;

const kPrinterCallMethodInitialize = "initialize";
const kPrinterCallMethodDiscovery = "discovery";
const kPrinterCallMethodConnect = "connect";
const kPrinterCallMethodAddLogo = "addLogo";
const kPrinterCallMethodAddTextAlign = "addTextAlign";
const kPrinterCallMethodAddFeedLine = "addFeedLine";
const kPrinterCallMethodAddText = "addText";
const kPrinterCallMethodAddTextSize = "addTextSize";
const kPrinterCallMethodAddBarcode = "addBarcode";
const kPrinterCallMethodAddCut = "addCut";
const kPrinterCallMethodClearCommandBuffer = "clearCommandBuffer";
const kPrinterCallMethodSendData = "sendData";
const kPrinterCallMethodDisconnect = "disconnect";
const kPrinterCallMethodGetStatus = "printer_get_status";

const kPrinterCallMethodPortArgument = 'port';
const kPrinterCallMethodTypeArgument = 'type';
const kPrinterCallMethodTextArgument = 'text';
const kPrinterCallMethodAlignArgument = 'align';
const kPrinterCallMethodLineArgument = 'line';
const kPrinterCallMethodWidthArgument = 'width';
const kPrinterCallMethodHeightArgument = 'height';
const kPrinterCallMethodCodeArgument = 'code';
const kPrinterCallMethodTimeoutArgument = 'timeout';
