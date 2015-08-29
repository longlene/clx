# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="pack node-style source files from a json stream into a browser bundle"
HOMEPAGE="https://github.com/substack/browser-pack"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/umd
dev-nodejs/through2
dev-nodejs/defined
dev-nodejs/combine-source-map
dev-nodejs/JSONStream
"
