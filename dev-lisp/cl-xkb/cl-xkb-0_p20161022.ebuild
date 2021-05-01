# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="344fb02397315af69246febd3536984f84a3731a"

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
