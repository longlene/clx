# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b34029f34206ab712998bdeb7fd33544d35c48ec"

DESCRIPTION="Common Lisp wrapper for libxkb"
HOMEPAGE="https://github.com/malcolmstill/cl-xkb"
SRC_URI="https://github.com/malcolmstill/cl-xkb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	x11-libs/libxkbcommon
"
