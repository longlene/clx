# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="423fa9bdd4a68a6ae517b18406d81491409ccae8"

DESCRIPTION="Encoding/end-of-line detection and external-format abstraction for Common Lisp"
HOMEPAGE="https://github.com/t-sin/inquisitor"
SRC_URI="https://github.com/t-sin/inquisitor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd ${PN}-flexi-test.asd t
}
