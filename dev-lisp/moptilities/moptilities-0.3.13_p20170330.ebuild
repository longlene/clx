# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a436f16b357c96b82397ec018ea469574c10dd41"

DESCRIPTION="Provides a compatibility layer for minor MOP implmentation differences."
HOMEPAGE="http://common-lisp.net/project/moptilities/"
SRC_URI="https://github.com/gwkkwg/moptilities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-lisp/closer-mop-0.55"

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests
}
