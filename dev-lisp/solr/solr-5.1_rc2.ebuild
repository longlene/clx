# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Allegro Common Lisp interface to Solr"
HOMEPAGE="https://github.com/franzinc/solr"
SRC_URI="mirror://github/franzinc/solr/archive/release${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources -t all triple-index *.lisp
	common-lisp-install-asdf ${PN}.asd
	dodoc README.md
}
