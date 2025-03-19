﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Extentions {
    public static class LanguageExtensions {
        public static bool In<T>(this T source, params T[] list) {
            return (list as IList<T>).Contains(source);
        }
    }
}

