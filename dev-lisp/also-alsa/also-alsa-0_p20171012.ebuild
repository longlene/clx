# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7ca5abc00e830a68238fe866f87938222a3ac04d"

DESCRIPTION="ALSA bindings for Common Lisp"
HOMEPAGE="https://github.com/varjagg/also-alsa/"
SRC_URI="https://github.com/varjagg/also-alsa/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/alsa-lib
"
