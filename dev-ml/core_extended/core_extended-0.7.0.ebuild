# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/core/core-0.7.0_beta1.ebuild,v 1.1 2011/02/24 20:12:10 aballier Exp $

EAPI="2"
inherit findlib eutils multilib

MY_P=${P/_/\~}
DESCRIPTION="Jane Street's extended library"
HOMEPAGE="http://www.janestreet.com/ocaml"
SRC_URI="http://www.janestreet.com/ocaml/${P}.tar.gz"

LICENSE="LGPL-2.1-linking-exception"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +ocamlopt test"

RDEPEND=">=dev-lang/ocaml-3.12[ocamlopt?]
	dev-ml/res
	>=dev-ml/sexplib-5.1.2
	>=dev-ml/core-0.7.0
	>=dev-ml/bin-prot-1.3.1
	>=dev-ml/fieldslib-0.1.2"
DEPEND="${RDEPEND}
	test? ( >=dev-ml/ounit-1.0.2 )"


oasis_use_enable() {
	echo "--override $2 `use $1 && echo \"true\" || echo \"false\"`"
}

src_configure() {
	./configure --prefix /usr \
		--libdir /usr/$(get_libdir) \
		--docdir /usr/share/doc/${PF}/html \
		--destdir "${D}" \
		$(oasis_use_enable debug debug) \
		$(oasis_use_enable ocamlopt is_native) \
		|| die
}

src_test() {
	LD_LIBRARY_PATH="${S}/_build/lib" emake test || die
}

src_install() {
	findlib_src_install
}
