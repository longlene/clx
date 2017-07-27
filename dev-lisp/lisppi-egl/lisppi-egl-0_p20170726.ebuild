# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="52eb2b8bc97e38dfeceb97cec207ecd56f7cc3ad"

DESCRIPTION="Minimal EGL bindings for X-free accelerated Raspberry Pi graphics"
HOMEPAGE="https://github.com/LISPPI/lisppi-egl"
SRC_URI="https://github.com/LISPPI/lisppi-egl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	virtual/opengl
"
