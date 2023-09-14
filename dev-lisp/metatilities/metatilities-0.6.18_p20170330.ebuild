# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="82e13df0545d0e47ae535ea35c5c99dd3a44e69e"

DESCRIPTION="Metatilities is metabang.com's set of core utilities."
HOMEPAGE="http://common-lisp.net/project/metatilities/"
SRC_URI="https://github.com/gwkkwg/metatilities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/asdf-system-connections
		>=dev-lisp/metatilities-base-0.6.3
		dev-lisp/moptilities
		dev-lisp/cl-containers
		dev-lisp/metabang-bind"

src_prepare() {
	default
	eapply "${FILESDIR}"/fix-export-new-states.patch
	rm -rf ${PN}-test.asd tests
}

