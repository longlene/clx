# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="streaming pipeline with a mutable configuration"
HOMEPAGE="https://github.com/substack/stream-splicer"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/indexof
dev-nodejs/through2
dev-nodejs/readable-wrap
dev-nodejs/readable-stream
dev-nodejs/isarray
dev-nodejs/inherits
"
