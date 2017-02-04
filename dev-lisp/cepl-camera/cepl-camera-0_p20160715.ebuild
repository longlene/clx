# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="28b5be48c2c08f474024c477ed9fd09b21e69e42"

DESCRIPTION="A camera implementation that plays well with cepl"
HOMEPAGE="https://github.com/cbaggers/cepl.camera"
SRC_URI="https://github.com/cbaggers/cepl.camera/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/rtg-math
"
