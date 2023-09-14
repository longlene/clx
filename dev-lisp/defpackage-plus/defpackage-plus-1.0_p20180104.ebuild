# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5492e27e0bdb7b75fa5177ea4388519dc7a75f11"

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
