# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib findlib

DESCRIPTION="library for dealing with 'text'"
HOMEPAGE="https://forge.ocamlcore.org/projects/ocaml-text/"
SRC_URI="https://forge.ocamlcore.org/frs/download.php/537/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +ocamlopt pcre"

DEPEND=">=dev-lang/ocaml-3.11[ocamlopt?]
virtual/libiconv
pcre? ( dev-ml/pcre-ocaml[ocamlopt?] )"
RDEPEND="$DEPEND"

src_configure() {
	./configure --prefix "${EPREFIX}"/usr \
	--mandir "${EPREFIX}"/usr/share/man \
	--infodir "${EPREFIX}"/usr/share/info \
	--datadir "${EPREFIX}"/usr/share \
	--sysconfdir "${EPREFIX}"/etc \
	--localstatedir "${EPREFIX}"/var/lib \
	--libdir $(get_libdir) \
	$(use_enable pcre)
}

src_install() {
	findlib_src_install
}
