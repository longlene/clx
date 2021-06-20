# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="23cd8e0f6ebb3736035a0ee5e57ee9555542eead"

DESCRIPTION="Provides a cross platform reader for the WAV file format"
HOMEPAGE="https://github.com/RobBlackwell/cl-wav"
SRC_URI="https://github.com/RobBlackwell/cl-wav/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-riff
"
BDEPEND=""
