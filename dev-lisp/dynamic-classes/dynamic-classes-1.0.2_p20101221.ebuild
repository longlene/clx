# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="844b077e5ac5ef2127603e692af983e9952ebae9"

DESCRIPTION="metabang.com's dynamic class utility."
HOMEPAGE="http://common-lisp.net/project/dynamic-classes/"
SRC_URI="https://github.com/gwkkwg/dynamic-classes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/metatilities-base"

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}

