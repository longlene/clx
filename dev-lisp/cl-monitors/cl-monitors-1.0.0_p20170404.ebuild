# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb691091cb111231085838b75536b580aca09cd0"

DESCRIPTION="Bindings to libmonitors, allowing the handling of monitor querying and resolution changing"
HOMEPAGE="https://github.com/Shirakumo/cl-monitors"
SRC_URI="https://github.com/Shirakumo/cl-monitors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/lin64-libmonitors.so
}
