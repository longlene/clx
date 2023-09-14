# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="49861c28fa60c4f07ac793386ea2fe89725b234d"

DESCRIPTION="A Common Lisp library to help group data into trees"
HOMEPAGE="https://github.com/AccelerationNet/group-by"
SRC_URI="https://github.com/AccelerationNet/group-by/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :group-by-test/,$d' ${PN}.asd
		rm -r tests
	fi
}
