# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="241578c86e937f0a2cbd9cf9cd8438f8268e9310"

DESCRIPTION="Common Lisp Graph Typesetting"
HOMEPAGE="https://github.com/mbattyani/cl-typegraph"
SRC_URI="https://github.com/mbattyani/cl-typegraph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-typesetting
"
