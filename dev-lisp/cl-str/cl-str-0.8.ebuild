# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Common Lisp string manipulation library"
HOMEPAGE="https://github.com/vindarel/cl-str"
SRC_URI="https://github.com/vindarel/cl-str/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/prove
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all READMD.md
}
