# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit common-lisp-3

DESCRIPTION="Archive is Nathan Froyd's tar/cpio package for CL."
HOMEPAGE="http://www.cliki.net/Archive"
SRC_URI="https://github.com/froydnj/archive/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-gray-streams
dev-lisp/cl-fad
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README TODO NEWS LICENSE
}
