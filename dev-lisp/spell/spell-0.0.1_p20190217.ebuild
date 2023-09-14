# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d2ae9489d53ad1618ad887824f7d93be08118098"

DESCRIPTION="Spellchecking package for Common Lisp"
HOMEPAGE="https://github.com/robert-strandh/Spell/"
SRC_URI="https://github.com/robert-strandh/Spell/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all english.txt
}
