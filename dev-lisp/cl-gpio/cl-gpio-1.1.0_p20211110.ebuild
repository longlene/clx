# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e161f3f3964018411e9788b0a2b6f44a4a0584c9"

DESCRIPTION="A library for the Linux GPIO kernel module"
HOMEPAGE="https://github.com/Shinmera/cl-gpio"
SRC_URI="https://github.com/Shinmera/cl-gpio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/cffi
"
