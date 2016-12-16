# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp CFFI wrapper for the Bullet Physics LIbary"
HOMEPAGE="https://github.com/BradWBeer/valentine"
SRC_URI=""

EGIT_REPO_URI="https://github.com/BradWBeer/valentine.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/swig
	dev-lisp/cffi
	sci-physics/bullet
"

src_install() {
	dolib.so libbullet_wrap.so
	common-lisp-3_src_install
}
