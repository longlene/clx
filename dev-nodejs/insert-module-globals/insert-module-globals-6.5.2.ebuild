# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="insert implicit module globals into a module-deps stream"
HOMEPAGE="https://github.com/substack/insert-module-globals"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xtend
dev-nodejs/through2
dev-nodejs/process
dev-nodejs/lexical-scope
dev-nodejs/concat-stream
dev-nodejs/combine-source-map
dev-nodejs/JSONStream
"
