# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Add source maps of multiple files, offset them and then combine them into one source map"
HOMEPAGE="https://github.com/thlorenz/combine-source-map"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/source-map
dev-nodejs/lodash_memoize
dev-nodejs/inline-source-map
dev-nodejs/convert-source-map
"
