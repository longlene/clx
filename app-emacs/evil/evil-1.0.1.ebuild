# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit elisp

DESCRIPTION="An extensible vi layer for Emacs"
HOMEPAGE="http://gitorious.org/evil/evil"
SRC_URI="http://gitorious.org/evil/evil/archive-tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/evil-evil"

src_compile() {
	rm Makefile
	makeinfo -o doc/evil.info doc/evil.texi
}

src_install() {
	elisp-install ${PN} *.el lib
	doinfo doc/evil.info
	dodoc doc/evil.pdf
}
