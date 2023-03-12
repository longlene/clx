# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="212721c24a8bb792714314ba52dfe818641f2e98"

DESCRIPTION="A simpler alternative to object prevalence for Common Lisp"
HOMEPAGE="https://github.com/robert-strandh/Clobber"
SRC_URI="https://github.com/robert-strandh/Clobber/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's/\(:file\ "demo"\)//' \
		-e 's/\(:file\ "demo2"\)//' \
		-i ${PN}.asd
}
