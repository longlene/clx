# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-r3 eutils

DESCRIPTION="Open source programming language for web application development"
HOMEPAGE="http://opalang.org/"
EGIT_REPO_URI="https://github.com/MLstate/opalang.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="
	>=dev-lang/ocaml-3.12
	dev-ml/camlidl
	dev-ml/ocaml-ssl
	dev-ml/cryptokit[ocamlopt]
	dev-ml/camlzip[ocamlopt]
	dev-ml/ocamlgraph[ocamlopt]
	dev-ml/ulex[ocamlopt]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/site_lib_fix.patch"
}

src_configure() {
	# econf can't be used there: configure doesn't accept "--prefix=..."
	# it only accepts "-prefix ..."
	./configure -prefix /usr || die "Failed to configure Opa"
}
