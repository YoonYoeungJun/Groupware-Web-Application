using Microsoft.Win32;

namespace eniFramework.WebApp.Core {
    public abstract class RegistryViewerBase {
        public abstract bool IsKeyExists(RegistryHive hive, string key);

        public abstract string[] GetMultiSzValue(RegistryHive hive, string key, string name);

        public abstract string GetSzValue(RegistryHive hive, string key, string name);
    }
}
