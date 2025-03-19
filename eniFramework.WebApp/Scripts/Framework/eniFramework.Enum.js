/// <reference path="../_references.js" />

var MessageBoxButtons = {};
MessageBoxButtons.Ok = 0;
MessageBoxButtons.OkCancel = 1;
MessageBoxButtons.RetryCancel = 2;
MessageBoxButtons.AbortRetryIgnore = 3;
MessageBoxButtons.YesNo = 4;
MessageBoxButtons.YesNoCancel = 5;

var DialogResult = {}
DialogResult.Ok = 0;
DialogResult.Cancel = 1;
DialogResult.Abort = 2;
DialogResult.Retry = 3;
DialogResult.Ignore = 4;
DialogResult.Yes = 5;
DialogResult.No = 6;

//지우고 아래 DBAccessMode 사용
var CUDChar = {}
CUDChar.None = 0;
CUDChar.Create = 1;
CUDChar.Update = 2;
CUDChar.Delete = 3;

var EnumDef = {};
//ViewType = { None: "N", Default: "D", Login: "L", Index: "I", ModuleView: "MV", View: "V", Error: "E", SessionTimeOut: "S"};
var ViewType = { None: 0, Top: 1, View: 2, ModuleView: 3, PopupView: 4 };
var ModuleType = { None: "N", Single: "S", SingleMulti: "SM", SingleMultiMulti: "SMM", Multi: "M", MultiMulti: "MM" };
var DBAccessMode = { None: 0, Query: 1, Create: 2, Update: 3, Delete: 4 };
var DbAccess = {
    CommandType: { Text: 1, StoredProcedure: 4, TableDirect: 512 },
    DbType: { AnsiString: 0, Binary: 1, Byte: 2, Boolean: 3, Currency: 4, Date: 5, DateTime: 6, Decimal: 7, Double: 8, Guid: 9, Int16: 10, Int32: 11, Int64: 12, Object: 13, SByte: 14, Single: 15, String: 16, Time: 17, UInt16: 18, UInt32: 19, UInt64: 20, VarNumeric: 21, AnsiStringFixedLength: 22, StringFixedLength: 23, Xml: 25, DateTime2: 26, DateTimeOffset: 27 },
    ParameterDirection: { Input: 1, Output: 2, InputOutput: 3, ReturnValue: 6 }
};
var CharSet = { Unicode: 0, ASCII: 1 };
var FilterVarType = { BraceWithSingleQuotation: 0, BraceWithDoubleQuotation: 1, NoBraceButReplSingleWithDoubleQuotation: 2 };
var ApplicationStartMode = { Release: 0, Debug: 1 }
var IsDebugWrite = { True: 0, False: 1 }
var IsLogWrite = { True: 0, False: 1 }
var LogType = { Default: 0, Info: 1, Warn: 2, Error: 3 };
var ContextMenuType = { MenuType1: 0, MenuType2: 1, MenuType3: 2, MenuType4: 3 };
//CallbackType = { PerformCallback: 1, GetValuesOnCustomCallback: 2 };
var Lang = { Ko: "KO", En: "EN", Cn: "CN", Jp: "JP" }
var RQDDocType = { EBC: "ebc", RQD: "rqd", EBQ: "EBQ" }
var RQDocDirection = { Width: "w", Height: "h" }
var RQDocMode = { View: "v", Print: "p" }
var CreateMode = { DefaultMode: 0, StandardMode: 1, UserControlMode: 2, BSLMode: 3 }
var KeyCode = {
    F1: 112,
    F2: 113,
    F3: 114,
    F4: 115,
    F5: 116,
    F6: 117,
    F7: 118,
    F8: 119,
    F9: 120,
    F10: 121,
    F11: 122,
    F12: 123,
    Ctrl: 17,
    Shift: 16,
    Alt: 18,
    Enter: 13,
    Home: 36,
    End: 35,
    Left: 37,
    Right: 39,
    Up: 38,
    Down: 40,
    PageUp: 33,
    PageDown: 34,
    Esc: 27,
    Space: 32,
    Tab: 9,
    Backspace: 8,
    Delete: 46,
    Insert: 45,
    ContextMenu: 93,
    Windows: 91,
    Decimal: 110
};

/* Farpoint Spread Sheet Enum */
var CellKind = {
    // 디폴트 필드
    Default: 0,
    // 잠긴 필드
    Protected: 1,
    // 필수 필드
    Required: 2
};
var BackColorStyle = {
    // (Default) Hides the right and bottom sides of the cells' grid lines under the background color
    OverGrid: 0,
    // Displays complete grid lines
    UnderGrid: 1,
    // Hides the horizontal grid lines under the background color
    OverHorizontalGridOnly: 2,
    // Hides the vertical grid lines under the background color
    OverVerticalGridOnly: 3
};
var BoarderStyle = { None: 0, FixedSingle: 1 };
var OperationMode = { Nomal: 0, ReadOnly: 1, RowMode: 2, SingleSelect: 3, MultiSelect: 4, ExtendedSelect: 5 };
var UserResize = { None: 0, Cols: 1, Rows: 2, Both: 3 };
var UserResizeCol = { Default: 0, On: 1, Off: 2 };
var UserResizeRow = { Default: 0, On: 1, Off: 2 };
var HAlign = { Left: 0, Right: 1, Center: 2 };
var TextTip = {
    // (Default) Control does not display text tips or cell notes
    Off: 0,
    // Control displays text tips and cell notes and aligns them to the header's or cell's rectangle, whether the control has the focus or not
    Fixed: 1,
    // Control displays text tips and cell notes and aligns them to the pointer, whether the control has the focus or not
    Floating: 2,
    // When the control has the focus, control displays text tips and cell notes and aligns them to the header's or cell's rectangle
    FixedFocusOnly: 3,
    // When the control has the focus, control displays text tips and cell notes and aligns them to the pointer
    FloatingFocusOnly: 4
};
var EditCharCase = {
    // Characters appear in lower case
    LowerCase: 0,
    // (Default) Characters appear as typed by the user
    NoCase: 1,
    // Characters appear in upper case
    UpperCase: 2
};
var EditCharSet = {
    /// ASCII : (Default) Any character
    ASCII: 0,
    /// Alpha : A–Z, a–z, space
    Alpha: 1,
    /// Alphanumeric : A–Z, a–z, 0–9, period, comma, space, minus sign (–)
    Alphanumeric: 2,
    /// Numeric : 0–9, period, minus sign (–)
    Numeric: 3
};
var CellType = {
    // Creates date cell
    Date: 0,
    // (Default) Creates edit cell
    Edit: 1,
    // Creates PIC cell
    PIC: 4,
    // Creates static text cell
    StaticText: 5,
    // Creates time cell
    Time: 6,
    // Creates button cell
    Button: 7,
    // Creates combo box cell
    ComboBox: 8,
    // Creates picture cell
    Picture: 9,
    // Creates check box cell
    CheckBox: 10,
    // Creates owner-drawn cell
    OwnerDrawn: 11,
    // Creates currency cell
    Currency: 12,
    // Creates numeric cell
    Number: 13,
    // Creates percent cell
    Percent: 14,
    // Creates scientific cell
    Scientific: 15,
    // Creates custom cell
    Custom:16
};
var Time24Hour = {
    // Displays time in 12-hour format
    Time12HourFormat: 0,
    // Displays time in 24-hour format
    Time24HourFormat: 1,
    // Resets to use the Time Format setting in the Windows Control Panel
    Default : 2
};
var UserColAction = {
    // (Default) Column is selected when user clicks the column header.
    Default: 0,
    // Data is sorted when user clicks the column header. Column sort indicator displays.
    Sort: 1,
    // Data is sorted when user clicks the column header. Column sort indicator does not display.
    SortNoIndicator: 2,
    // Column is automatically sized to best fit the data when the user double clicks the column header.
    AutoSize: 3
};

var ColUserSortIndicator = {
    // (Default) No pointer appears No sorting occurred. The BeforeUserSort and AfterUserSort events did not occur.
    None: 0,
    // pointer appears when the column is sorted Ascending sort occurred. The BeforeUserSort and AfterUserSort events occurred.
    Ascending: 1,
    // pointer appears when the column is sorted Descending sort occurred. The BeforeUserSort and AfterUserSort events occurred.
    Descending: 2,
    // No pointer appears No sorting can occur. The BeforeUserSort and AfterUserSort events did not occur.
    Disabled: 3
};
var CellBorderPosition = { None: 0, CellLeft: 1, CellRight: 2, CellTop: 4, CellBottom: 8, CellAll: 15, CellOutLine: 16 };
var CellBorderStyle = { CellDefault: 0, CellSolid: 1, CellDash: 2, CellDot: 3, CellDashDot: 4, CellDashDotDot: 5, CellBlank: 6, CellFineSolid: 11, CellFineDash: 12, CellFineDot: 13, CellFineDashDot: 14, CellFineDashDotDot: 15 };
var ButtonAlign = {
    // (Default) Text at the bottom, picture at the top
    ButtonAlignBottom: 0,
    // Text at the top, picture at the bottom
    ButtonAlignTop: 1,
    // Text at the left, picture at the right
    ButtonAlignLeft: 2,
    // Text at the right, picture at the left
    ButtonAlignRight: 3
};
var ButtonType = {
    // (Default) Button does not stay down
    Normal: 0,
    // Button stays down after user presses it
    TwoState : 1
};
var DateFormat = {
    // 15/NOV/95
    DDMONYY: 0,
    // 15/11/95
    DDMMYY: 1,
    // 11/15/95
    MMDDYY: 2,
    // 95/11/15
    YYMMDD: 3,
    // Resets to use the Date Format setting in the Windows Control Panel
    Default : 99
};
var CheckType = {
    // (Default) Specifies that the check box is a two-state check box
    TwoState : 0,
    // Specifies that the check box is a three-state check box
    TreeState : 1
};

var CheckTitleAlign = {
    Left: 0, Right: 1
};
var CurrencyPosStyle = {
    // (Default) Uses the regional Currency Format setting in the Windows Control Panel
    CurrencyPosStyleIntl: 0,
    // $1.1
    CurrencyPosStyle1: 1,
    // 1.1$
    CurrencyPosStyle2: 2,
    // $ 1.1
    CurrencyPosStyle3: 3,
    // 1.1 $
    CurrencyPosStyle4 : 4
};
var CurrencyNegStyle = {
    // (Default) Uses the regional Currency Format setting in the Windows Control Panel
    CurrencyNegStyleIntl: 0,
    // ($1.1)
    CurrencyNegStyle1: 1,
    // –$1.1
    CurrencyNegStyle2: 2,
    // $–1.1
    CurrencyNegStyle3: 3,
    // $1.1–
    CurrencyNegStyle4: 4,
    // (1.1$)
    CurrencyNegStyle5: 5,
    // –1.1$
    CurrencyNegStyle6: 6,
    // 1.1-$
    CurrencyNegStyle7: 7,
    // 1.1$–
    CurrencyNegStyle8: 8,
    // –1.1 $
    CurrencyNegStyle9: 9,
    // –$ 1.1
    CurrencyNegStyle10: 10,
    // 1.1 $–
    CurrencyNegStyle11: 11,
    // $ 1.1–
    CurrencyNegStyle12: 12,
    // $ –1.1
    CurrencyNegStyle13: 13,
    // 1.1– $
    CurrencyNegStyle14: 14,
    // ($ 1.1)
    CurrencyNegStyle15: 15,
    // (1.1 $)
    CurrencyNegStyle16: 16
};
var CurrencyLeadingZero = {
    // (Default) Uses the regional setting for Number Format in the Windows Control Panel
    LeadingZeroIntl: 0,
    // Removes the leading zero
    LeadingZeroNo: 1,
    // Displays the leading zero
    LeadingZeroYes : 2
};
var ClipboardOptions = {
    NoHeaders : 0,
    CopyRowHeaders : 1,
    PasteRowHeaders: 2,
    CopyColumnHeaders: 4,
    PasteColumnHeaders :8,
    CopyPasteAllHeaders: 15
};
var EditEnterAction = {
    None: 0,
    Up: 1,
    Down: 2,
    Left: 3,
    Right: 4,
    Next: 5,
    Previous: 6,
    Same: 7,
    NextRow: 8
};
var MergeOptions = {
    MergeNone: 0,
    MergeAlways: 1,
    MergeRestricted: 2
};