/*++

Copyright (c) 2016 Minoca Corp.

    This file is licensed under the terms of the GNU General Public License
    version 3. Alternative licensing terms are available. Contact
    info@minocacorp.com for details. See the LICENSE file at the root of this
    project for complete licensing information.

Module Name:

    Minoca NetLink Library

Abstract:

    This module contains the netlink sockets library, which it built on top
    of the C library socket's interface and offers a set of APIs to make
    use of netlink sockets easier.

Author:

    Chris Stevens 24-Mar-2016

Environment:

    User

--*/

function build() {
    sources = [
        "generic.c",
        "netlink.c",
    ];

    includes = [
        "$//apps/libc/include"
    ];

    lib_config = {
        "LDFLAGS": ["-nostdlib"]
    };

    lib = {
        "label": "libnetlink",
        "inputs": sources,
        "entry": "NlInitialize",
        "includes": includes,
        "config": lib_config,
        "major_version": "1",
    };

    entries = shared_library(lib);
    return entries;
}

return build();

