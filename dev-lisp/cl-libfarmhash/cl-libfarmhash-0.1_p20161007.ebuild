# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="14f0b9d9b49759b37e0924b9aabf8f4681337968"

DESCRIPTION="Common Lisp Bindings for Google's Farmhash"
HOMEPAGE="https://github.com/macdavid313/cl-libfarmhash"
SRC_URI="https://github.com/macdavid313/cl-libfarmhash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/farmhash
	dev-lisp/cffi
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
