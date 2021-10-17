# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="The Bone Lisp programming language"
HOMEPAGE="https://github.com/wolfgangj/bone-lisp"
SRC_URI="https://github.com/wolfgangj/bone-lisp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bone
	dodoc README.md
}
