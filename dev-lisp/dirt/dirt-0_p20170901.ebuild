# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0d13ebc2e63e7e155d919602139b3f085d575867"

DESCRIPTION="A front-end for cl-soil which loads images straight to cepl:c-arrays and cepl:textures"
HOMEPAGE="https://github.com/cbaggers/dirt"
SRC_URI="https://github.com/cbaggers/dirt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/cl-soil
"
