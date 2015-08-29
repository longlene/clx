# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="sort module-deps output for deterministic browserify bundles"
HOMEPAGE="ihttps://github.com/substack/deps-sort"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/subarg
dev-nodejs/through2
dev-nodejs/JSONStream
dev-nodejs/shasum
"
