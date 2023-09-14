# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0c5eca64214c35d711d7755dd06d60751e838451"

DESCRIPTION="Helps macro writers produce better errors for macro users"
HOMEPAGE="https://github.com/scymtym/trivial-with-current-source-form"
SRC_URI="https://github.com/scymtym/trivial-with-current-source-form/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version-string.sexp
}
