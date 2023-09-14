# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f2e4500b180316123fbd549bd51c751ee2d6ba0f"

DESCRIPTION="Jaro-Winkler and Levenshtein string distance algorithms for Common Lisp"
HOMEPAGE="https://github.com/vsedach/vas-string-metrics"
SRC_URI="https://github.com/vsedach/vas-string-metrics/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r test.${PN}.asd test.lisp
}
