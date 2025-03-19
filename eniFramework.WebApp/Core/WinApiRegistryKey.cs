using Microsoft.Win32;
using System;

namespace eniFramework.WebApp.Core {
    public class WinApiRegistryKey : DisposableBase {
        private IntPtr handle;

        public bool Exists {
            get {
                return this.handle != IntPtr.Zero;
            }
        }

        public WinApiRegistryKey(RegistryHive hive, string key, WinApiRegistryHelper.ResigtryAccess access) {
            this.handle = WinApiRegistryHelper.OpenRegistryKey(hive, key, access);
        }

        protected override void DisposeUnmanaged() {
            if (this.handle != IntPtr.Zero)
                WinApiRegistryHelper.CloseRegistryKey(this.handle);
            this.handle = IntPtr.Zero;
            base.DisposeUnmanaged();
        }

        public string[] GetMultiSzValue(string name) {
            if (!this.Exists)
                return (string[])null;
            return WinApiRegistryHelper.ReadRegistryKeyMultiSzValue(this.handle, name);
        }

        public string GetSzValue(string name) {
            if (!this.Exists)
                return (string)null;
            return WinApiRegistryHelper.ReadRegistryKeySzValue(this.handle, name);
        }
    }
}
