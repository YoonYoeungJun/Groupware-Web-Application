using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Security;
using System.Text;

namespace eniFramework.WebApp.Core {
    public static class WinApiRegistryHelper {
        [SecuritySafeCritical]
        public static IntPtr OpenRegistryKey(RegistryHive hkey, string subkey, WinApiRegistryHelper.ResigtryAccess access) {
            IntPtr hkResult;
            if (WinApiRegistryHelper.Import.RegOpenKeyEx(WinApiRegistryHelper.HkeyToPtr(hkey), subkey, 0, (int)access, out hkResult) != 0)
                hkResult = IntPtr.Zero;
            return hkResult;
        }

        [SecuritySafeCritical]
        public static void CloseRegistryKey(IntPtr key) {
            WinApiRegistryHelper.Import.RegCloseKey(key);
        }

        private static IntPtr HkeyToPtr(RegistryHive hkey) {
            if (hkey != RegistryHive.CurrentUser)
                return WinApiRegistryHelper.Import.HKEY_LOCAL_MACHINE;
            return WinApiRegistryHelper.Import.HKEY_CURRENT_USER;
        }

        [SecuritySafeCritical]
        public static string[] ReadRegistryKeyMultiSzValue(IntPtr key, string name) {
            WinApiRegistryHelper.Import.RType lpType = WinApiRegistryHelper.Import.RType.RegMultiSz;
            uint pcbData = 0;
            if ((int)WinApiRegistryHelper.Import.RegQueryValueEx(key, name, 0, ref lpType, (byte[])null, ref pcbData) != 0)
                return (string[])null;
            byte[] numArray = new byte[(int)pcbData];
            if ((int)WinApiRegistryHelper.Import.RegQueryValueEx(key, name, 0, ref lpType, numArray, ref pcbData) != 0)
                return (string[])null;
            List<string> stringList = new List<string>();
            string str = Encoding.Unicode.GetString(numArray, 0, (int)pcbData);
            int num = -1;
            while (true) {
                int startIndex = num + 1;
                num = str.IndexOf(char.MinValue, startIndex);
                if (num > startIndex)
                    stringList.Add(str.Substring(startIndex, num - startIndex));
                else
                    break;
            }
            return stringList.ToArray();
        }

        [SecuritySafeCritical]
        public static string ReadRegistryKeySzValue(IntPtr key, string name) {
            WinApiRegistryHelper.Import.RType lpType = WinApiRegistryHelper.Import.RType.RegSz;
            uint pcbData = 0;
            if ((int)WinApiRegistryHelper.Import.RegQueryValueEx(key, name, 0, ref lpType, (byte[])null, ref pcbData) != 0)
                return (string)null;
            byte[] numArray = new byte[(int)pcbData];
            if ((int)WinApiRegistryHelper.Import.RegQueryValueEx(key, name, 0, ref lpType, numArray, ref pcbData) != 0)
                return (string)null;
            return Encoding.Unicode.GetString(numArray, 0, (int)pcbData);
        }

        [Flags]
        public enum ResigtryAccess {
            QueryValue = 1,
            SetValue = 2,
            CreateSubKey = 4,
            EnumerateSubKeys = 8,
            Notify = 16,
            CreateLink = 32,
            Read = 131097,
            WOW64_32Key = 512,
            WOW64_64Key = 256,
            WOW64_Res = WOW64_64Key | WOW64_32Key,
        }

        private static class Import {
            public static IntPtr HKEY_LOCAL_MACHINE = new IntPtr(-2147483646);
            public static IntPtr HKEY_CURRENT_USER = new IntPtr(-2147483647);
            public const int KEY_QUERY_VALUE = 1;
            public const int KEY_SET_VALUE = 2;
            public const int KEY_CREATE_SUB_KEY = 4;
            public const int KEY_ENUMERATE_SUB_KEYS = 8;
            public const int KEY_NOTIFY = 16;
            public const int KEY_CREATE_LINK = 32;
            public const int KEY_WOW64_32KEY = 512;
            public const int KEY_WOW64_64KEY = 256;
            public const int KEY_WOW64_RES = 768;
            public const int KEY_READ = 131097;

            [DllImport("advapi32.dll", EntryPoint = "RegQueryValueExW", CharSet = CharSet.Unicode, SetLastError = true)]
            public static extern uint RegQueryValueEx(IntPtr hKey, string lpValueName, int lpReserved, ref WinApiRegistryHelper.Import.RType lpType, byte[] pvData, ref uint pcbData);

            [DllImport("advapi32.dll", SetLastError = true)]
            public static extern int RegCloseKey(IntPtr hKey);

            [DllImport("advapi32.dll", CharSet = CharSet.Auto)]
            public static extern int RegOpenKeyEx(IntPtr hKey, string subKey, int ulOptions, int samDesired, out IntPtr hkResult);

            public enum RFlags {
                RegNone = 1,
                RegSz = 2,
                RegExpandSz = 4,
                RegBinary = 8,
                RegDword = 16,
                Dword = 24,
                RegMultiSz = 32,
                RegQword = 64,
                Qword = 72,
                Any = 65535,
                Noexpand = 268435456,
                RrfZeroonfailure = 536870912,
            }

            public enum RType {
                RegNone = 0,
                RegSz = 1,
                RegExpandSz = 2,
                RegBinary = 3,
                RegDword = 4,
                RegDwordLittleEndian = 4,
                RegDwordBigEndian = 5,
                RegLink = 6,
                RegMultiSz = 7,
                RegResourceList = 8,
                RegFullResourceDescriptor = 9,
                RegResourceRequirementsList = 10,
                RegQword = 11,
                RegQwordLittleEndian = 11,
            }
        }
    }
}
