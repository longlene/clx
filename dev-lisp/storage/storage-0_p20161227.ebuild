# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c5b7f2aa58b044d77b4abaacf66dc234f1261089"

DESCRIPTION="CL persistent object storage"
HOMEPAGE="https://github.com/stassats/storage"
SRC_URI="https://github.com/stassats/storage/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/ieee-floats
"
