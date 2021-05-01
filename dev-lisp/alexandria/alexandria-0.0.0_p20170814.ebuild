# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e5c54bc30b0887c237bde2827036d17315f88737"

DESCRIPTION="A collection of public domain utilities."
HOMEPAGE="http://common-lisp.net/project/alexandria/"
SRC_URI="https://gitlab.common-lisp.net/alexandria/alexandria/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc test"

src_prepare() {
	eapply_user
	sed -e 's/(:static-file.*LICENCE.*)//' \
		-e 's/(:static-file.*tests.*)//' \
		-i alexandria.asd
	use test || rm ${PN}-tests.asd tests.lisp
}
