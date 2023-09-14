# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5433f5e95f1cce63a81259a471150834c6a59364"

DESCRIPTION="The 32-bit version of Murmurhash3 for Common Lisp"
HOMEPAGE="https://github.com/ruricolist/cl-murmurhash"
SRC_URI="https://github.com/ruricolist/cl-murmurhash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "cl-murmurhash\/test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
