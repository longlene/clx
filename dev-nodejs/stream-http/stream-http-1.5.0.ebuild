# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Streaming http in the browser"
HOMEPAGE="https://github.com/jhiesey/stream-http"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xtend
dev-nodejs/object-keys
dev-nodejs/inherits
dev-nodejs/indexof
dev-nodejs/foreach
dev-nodejs/builtin-status-codes
"
