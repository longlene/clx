# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d1df53c22403121bffb5d553cf7acb1503850e7"

DESCRIPTION="Adds trees, sparse arrays, and other useful containers to CommonLisp."
HOMEPAGE="http://common-lisp.net/project/cl-containers/"
SRC_URI="https://github.com/gwkkwg/cl-containers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="
	dev-lisp/asdf-system-connections
	>=dev-lisp/metatilities-base-0.6.6
"

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests
}

