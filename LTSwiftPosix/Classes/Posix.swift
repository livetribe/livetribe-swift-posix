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

public class Posix: Fcntl {
    public static var sharedInstance = Posix()

    public var fcntl: Fcntl = DefaultFcntl()

    public func creat(path: UnsafePointer<Int8>, _ mode: mode_t) -> Int32 {
        return fcntl.creat(path, mode)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ value: CInt) -> CInt {
        return fcntl.fcntl(fd, cmd, value)
    }

    public func fcntl(fd: CInt, _ cmd: CInt) -> CInt {
        return fcntl.fcntl(fd, cmd)
    }

    public func fcntl(fd: CInt, _ cmd: CInt, _ ptr: UnsafeMutablePointer<Void>) -> CInt {
        return fcntl.fcntl(fd, cmd, ptr)
    }

    public func open(path: UnsafePointer<CChar>, oflag: CInt) -> CInt {
        return fcntl.open(path, oflag: oflag)
    }

    public func open(path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return fcntl.open(path, oflag, mode)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt) -> CInt {
        return fcntl.openat(fd, path, oflag)
    }

    public func openat(fd: CInt, _ path: UnsafePointer<CChar>, _ oflag: CInt, _ mode: mode_t) -> CInt {
        return fcntl.openat(fd, path, oflag, mode)
    }
}
