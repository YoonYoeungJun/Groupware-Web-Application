using Microsoft.Win32;
using System.Collections.Generic;

namespace eniFramework.WebApp.Core {
    public class WinApiRegistryMultiKey : DisposableBase {
        private List<WinApiRegistryKey> keys = new List<WinApiRegistryKey>();

        public bool Exists {
            get {
                return this.keys.Count > 0;
            }
        }

        public WinApiRegistryMultiKey(RegistryHive hive, string key, WinApiRegistryHelper.ResigtryAccess access) {
            WinApiRegistryKey winApiRegistryKey1 = new WinApiRegistryKey(hive, key, access | WinApiRegistryHelper.ResigtryAccess.WOW64_32Key);
            if (winApiRegistryKey1.Exists)
                this.keys.Add(winApiRegistryKey1);
            WinApiRegistryKey winApiRegistryKey2 = new WinApiRegistryKey(hive, key, access | WinApiRegistryHelper.ResigtryAccess.WOW64_64Key);
            if (!winApiRegistryKey2.Exists)
                return;
            this.keys.Add(winApiRegistryKey2);
        }

        protected override void DisposeManaged() {
            foreach (DisposableBase key in this.keys)
                key.Dispose();
            this.keys.Clear();
            base.DisposeManaged();
        }

        public string[] GetMultiSzValue(string name) {
            List<string> stringList = new List<string>();
            foreach (WinApiRegistryKey key in this.keys) {
                string[] multiSzValue = key.GetMultiSzValue(name);
                if (multiSzValue != null)
                    stringList.AddRange((IEnumerable<string>)multiSzValue);
            }
            if (stringList.Count <= 0)
                return (string[])null;
            return stringList.ToArray();
        }

        public string GetSzValue(string name) {
            foreach (WinApiRegistryKey key in this.keys) {
                string szValue = key.GetSzValue(name);
                if (szValue != null)
                    return szValue;
            }
            return (string)null;
        }
    }
}
