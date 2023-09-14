# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b62b48a30b6501398863cf27f7ae2f260fbd4aac"

DESCRIPTION="A common lisp library to unify access to common dictionary-like data-structures"
HOMEPAGE="https://github.com/AccelerationNet/access"
SRC_URI="https://github.com/AccelerationNet/access/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r test
		sed -e '/defsystem\ :access-test/,$d' -i access.asd
	fi
}
