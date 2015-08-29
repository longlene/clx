# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="quote and parse shell commands"
HOMEPAGE="https://github.com/substack/node-shell-quote"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/array-filter
dev-nodejs/array-reduce
dev-nodejs/array-map
dev-nodejs/jsonify
"
