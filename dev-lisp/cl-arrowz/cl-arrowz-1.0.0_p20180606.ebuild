# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dc306e727c3c60963cf36fdcf87ea8fb9a47e29a"

DESCRIPTION="Drop in replacement for cl-arrows with some bonus features"
HOMEPAGE="https://github.com/eschulte/cl-arrowz"
SRC_URI="https://github.com/eschulte/cl-arrowz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/defsystem "cl-arrowz/tests"/,$d' -i ${PN}.asd
		rm -rf tests
	fi
}

