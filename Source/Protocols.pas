﻿namespace RemObjects.Elements.System;

interface

type
  IEquatable<T> = public interface
    method Equals(rhs: T): Boolean;
  end;

  IComparable< {in} T> = public interface
    method CompareTo(rhs: T): Integer;
  end;

  IDisposable = public interface
    method Dispose;
  end;

implementation

end.