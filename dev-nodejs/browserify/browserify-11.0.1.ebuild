# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="browser-side require\(\) the node way"
HOMEPAGE="http://browserify.org"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xtend
dev-nodejs/vm-browserify
dev-nodejs/util
dev-nodejs/url
dev-nodejs/tty-browserify
dev-nodejs/timers-browserify
dev-nodejs/through2
dev-nodejs/syntax-error
dev-nodejs/subarg
dev-nodejs/string_decoder
dev-nodejs/stream-browserify
dev-nodejs/shell-quote
dev-nodejs/shasum
dev-nodejs/resolve
dev-nodejs/readable-stream
dev-nodejs/read-only-stream
dev-nodejs/querystring-es3
dev-nodejs/punycode
dev-nodejs/process
dev-nodejs/path-browserify
dev-nodejs/parents
dev-nodejs/os-browserify
dev-nodejs/module-deps
dev-nodejs/labeled-stream-splicer
dev-nodejs/isarray
dev-nodejs/insert-module-globals
dev-nodejs/inherits
dev-nodejs/https-browserify
dev-nodejs/stream-http
dev-nodejs/htmlescape
dev-nodejs/has
dev-nodejs/glob
dev-nodejs/events
dev-nodejs/duplexer2
dev-nodejs/domain-browser
dev-nodejs/deps-sort
dev-nodejs/defined
dev-nodejs/crypto-browserify
dev-nodejs/constants-browserify
dev-nodejs/console-browserify
dev-nodejs/concat-stream
dev-nodejs/commondir
dev-nodejs/builtins
dev-nodejs/buffer
dev-nodejs/browserify-zlib
dev-nodejs/browser-resolve
dev-nodejs/browser-pack
dev-nodejs/assert
dev-nodejs/JSONStream
"
