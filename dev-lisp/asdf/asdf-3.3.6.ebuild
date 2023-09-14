# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit prefix common-lisp-3

DESCRIPTION="ASDF is Another System Definition Facility for Common Lisp"
HOMEPAGE="http://common-lisp.net/project/asdf/"
SRC_URI="https://gitlab.common-lisp.net/asdf/asdf/-/archive/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos ~x86-solaris"
IUSE="doc"

SLOT="0/${PVR}"

DEPEND="doc? ( virtual/texi2dvi )"
PDEPEND="virtual/commonlisp
		~dev-lisp/uiop-${PV}"

install_docs() {
	(cd doc ; dodoc *.{html,css,ico,png} "${PN}.pdf" ; dodoc -r asdf )
	if has_version ">=dev-lisp/sbcl-1.4.0" ; then
		(cd doc ; doinfo "${PN}.info" )
	fi
}

src_compile() {
	emake
	use doc && emake -C doc
}

src_test() {
	common-lisp-export-impl-args "$(common-lisp-find-lisp-impl)"
	test/run-tests.sh ${CL_BINARY}
}

src_install() {
	insinto "${CLSOURCEROOT}/${PN}"
	doins -r build version.lisp-expr
	dodoc README.md TODO
	use doc && install_docs
	insinto /etc/common-lisp
	cd "${T}" || die
	cp "${FILESDIR}/gentoo-init.lisp" "${FILESDIR}/source-registry.conf" . || die
	eprefixify gentoo-init.lisp source-registry.conf
	doins gentoo-init.lisp source-registry.conf
}
