# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="99b6084f6b0b24a31f6e4a935594047bd0a874b2"

DESCRIPTION="DEFPACKAGE-PLUS is an extensible DEFPACKAGE variant with version support"
HOMEPAGE="https://github.com/rpav/defpackage-plus"
SRC_URI="https://github.com/rpav/defpackage-plus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
