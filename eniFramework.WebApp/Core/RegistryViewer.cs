using Microsoft.Win32;

namespace eniFramework.WebApp.Core {
    public class RegistryViewer : RegistryViewerBase {
        public static RegistryViewer Current = new RegistryViewer();

        public override bool IsKeyExists(RegistryHive hive, string key) {
            using (WinApiRegistryMultiKey wkey = this.GetWKey(hive, key))
                return wkey.Exists;
        }

        public override string[] GetMultiSzValue(RegistryHive hive, string key, string name) {
            using (WinApiRegistryMultiKey wkey = this.GetWKey(hive, key))
                return wkey.GetMultiSzValue(name);
        }

        public override string GetSzValue(RegistryHive hive, string key, string name) {
            using (WinApiRegistryMultiKey wkey = this.GetWKey(hive, key))
                return wkey.GetSzValue(name);
        }

        private WinApiRegistryMultiKey GetWKey(RegistryHive hive, string key) {
            key = key.Replace('/', '\\');
            return new WinApiRegistryMultiKey(hive, key, WinApiRegistryHelper.ResigtryAccess.Read);
        }
    }
}
