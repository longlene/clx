# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7d9767690f83215e3c09089e60f622c34777f1bd"

DESCRIPTION="Common Lisp Binding for Hoedown"
HOMEPAGE="https://github.com/macdavid313/cl-libhoedown"
SRC_URI="https://github.com/macdavid313/cl-libhoedown/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/hoedown
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
