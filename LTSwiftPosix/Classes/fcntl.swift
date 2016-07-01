//
// Copyright 2016 the original author or authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

public protocol Fcntl {
    func creat(_: UnsafePointer<Int8>, _: mode_t) -> Int32

    func fcntl(fd: CInt, _ cmd: CInt, _ value: CInt) -> CInt

    func fcntl(fd: CInt, _ cmd: CInt) -> CInt

    func fcntl(fd: CInt, _ cmd: CInt, _ ptr: UnsafeMutablePointer<Void>) -> CInt

    func open(path: UnsafePointer<CChar>, oflag: CInt) -> CInt

    func open(path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt

    func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt) -> CInt

    func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt
}

public func creat(path: UnsafePointer<Int8>, _ mode: mode_t) -> Int32 {
    return Posix.sharedInstance.creat(path, mode)
}

public func fcntl(fd: CInt, _ cmd: CInt, _ value: CInt) -> CInt {
    return Posix.sharedInstance.fcntl(fd, cmd, value)
}

public func fcntl(fd: CInt, _ cmd: CInt) -> CInt {
    return Posix.sharedInstance.fcntl(fd, cmd)
}

public func fcntl(fd: CInt, _ cmd: CInt, _ ptr: UnsafeMutablePointer<Void>) -> CInt {
    return Posix.sharedInstance.fcntl(fd, cmd, ptr)
}

public func open(path: UnsafePointer<CChar>, oflag: CInt) -> CInt {
    return Posix.sharedInstance.open(path, oflag: oflag)
}

public func open(path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
    return Posix.sharedInstance.open(path, oflag, mode)
}

public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt) -> CInt {
    return Posix.sharedInstance.openat(fd, path, oflag)
}

public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
    return Posix.sharedInstance.openat(fd, path, oflag, mode)
}

#if os(Linux)

import Glibc

public struct DefaultFcntl: Fcntl {
    public func creat(path: UnsafePointer<Int8>, _ mode: mode_t) -> Int32 {
        return Glibc.creat(path, mode)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ value: CInt) -> CInt {
        return Glibc.fcntl(fd, cmd, value)
    }

    public func fcntl(fd: CInt, _ cmd: CInt) -> CInt {
        return Glibc.fcntl(fd, cmd)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ ptr: UnsafeMutablePointer<Void>) -> CInt {
        return Glibc.fcntl(fd, cmd, ptr)
    }

    public func open(path: UnsafePointer<CChar>, oflag: CInt) -> CInt {
        return Glibc.open(path, oflag)
    }

    public func open(path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return Glibc.open(path, oflag, mode)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt) -> CInt {
        return Glibc.openat(fd, path, oflag)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return Glibc.openat(fd, path, oflag, mode)
    }
}

#else

import Darwin

public struct DefaultFcntl: Fcntl {
    public func creat(path: UnsafePointer<Int8>, _ mode: mode_t) -> Int32 {
        return Darwin.creat(path, mode)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ value: CInt) -> CInt {
        return Darwin.fcntl(fd, cmd, value)
    }

    public func fcntl(fd: CInt, _ cmd: CInt) -> CInt {
        return Darwin.fcntl(fd, cmd)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ ptr: UnsafeMutablePointer<Void>) -> CInt {
        return Darwin.fcntl(fd, cmd, ptr)
    }

    public func open(path: UnsafePointer<CChar>, oflag: CInt) -> CInt {
        return Darwin.open(path, oflag)
    }

    public func open(path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return Darwin.open(path, oflag, mode)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt) -> CInt {
        return Darwin.openat(fd, path, oflag)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return Darwin.openat(fd, path, oflag, mode)
    }
}

#endif
