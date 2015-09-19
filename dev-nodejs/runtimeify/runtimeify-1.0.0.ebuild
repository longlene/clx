# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Wrapper around browserify that bundles for runtime.js"
HOMEPAGE="https://github.com/runtimejs/runtimeify"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/through2
dev-nodejs/streamifier
dev-nodejs/stream-to-buffer
dev-nodejs/shelljs
dev-nodejs/runtime-node-net
dev-nodejs/runtime-node-dns
dev-nodejs/request
dev-nodejs/minimist
dev-nodejs/http-node
dev-nodejs/combined-stream
dev-nodejs/colors
dev-nodejs/buffer-crc32
dev-nodejs/browserify
dev-nodejs/async
"
