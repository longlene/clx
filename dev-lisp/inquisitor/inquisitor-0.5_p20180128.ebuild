# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="57610f688d3a2990817e34fca1d907eba433900f"

DESCRIPTION="Encoding/end-of-line detection and external-format abstraction for Common Lisp"
HOMEPAGE="https://github.com/cxxxr/inquisitor"
SRC_URI="https://github.com/cxxxr/inquisitor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
