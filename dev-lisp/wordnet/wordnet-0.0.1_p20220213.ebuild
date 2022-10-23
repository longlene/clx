# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8cd0db8f5e84e7a930fa74e590ecddf75cd8e5d6"

DESCRIPTION="Common Lisp interface to WrodNet"
HOMEPAGE="https://github.com/phoe/wordnet/"
SRC_URI="https://github.com/phoe/wordnet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all dict
}
