# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="A variant of READ secure against internbombing, excessive input and macro characters"
HOMEPAGE="https://github.com/phoe/secure-read"
SRC_URI="https://github.com/phoe/secure-read/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/trivial-garbage
"

src_prepare() {
	eapply_user
	rm test.lisp
}
