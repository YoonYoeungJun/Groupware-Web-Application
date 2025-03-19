using System;

namespace eniFramework.WebApp.Core {
    public abstract class DisposableBase : IDisposable {
        private bool disposed;

        public bool Disposed {
            get {
                return this.disposed;
            }
        }

        ~DisposableBase() {
            this.Dispose(false);
        }

        public void Dispose() {
            this.Dispose(true);
            GC.SuppressFinalize((object)this);
        }

        protected virtual void DisposeManaged() {
        }

        protected virtual void DisposeUnmanaged() {
        }

        private void Dispose(bool disposing) {
            if (this.Disposed)
                return;
            this.disposed = true;
            if (disposing)
                this.DisposeManaged();
            this.DisposeUnmanaged();
        }
    }
}
