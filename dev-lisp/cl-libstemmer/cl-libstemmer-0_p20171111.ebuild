# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="00be1bc089c0cc1fe6d64149f0a9b0a095614c10"

DESCRIPTION="Snowball stemming algorithms"
HOMEPAGE="https://github.com/ruricolist/cl-libstemmer"
SRC_URI="https://github.com/ruricolist/cl-libstemmer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/trivial-garbage
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
"

src_compile() {
	emake -C libstemmer_c libstemmer.so
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all libstemmer_c/libstemmer.so stopwords
}
