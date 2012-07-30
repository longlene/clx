# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
NEED_PYTHON=2.6
SUPPORT_PYTHON_ABIS="1"

inherit eutils distutils

if [[ ${PV} == "9999" ]] ; then
	EBZR_REPO_URI="http://bzr.bugseverywhere.org/${PN}"
	inherit bzr
	SRC_URI=""
else
	SRC_URI="http://bugseverywhere.org/${PN}/${P}.tar.gz"
fi

DESCRIPTION="Bugs Everywere distributed bug tracker"
HOMEPAGE="http://bugseverywhere.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python
	dev-python/pyyaml"
DEPEND="${RDEPEND}
	dev-vcs/bzr
	app-text/docbook-sgml-utils"

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		bzr_src_unpack
	else
		unpack ${A}
	fi
	cd "${S}"
}

src_prepare() {
	epatch "${FILESDIR}/${P}"-install-dir.patch
	epatch "${FILESDIR}/${P}"-version.patch
	epatch "${FILESDIR}/${P}"-docbook2man.patch
	if [[ ${PV} == "9999" ]] ; then
		bzr_src_prepare || die
		EBZR_BRANCH_DIR="${EBZR_STORE_DIR}/${EBZR_CACHE_DIR}"
		bzr version-info --format python "${EBZR_BRANCH_DIR}" > \
			"${S}/libbe/_version.py" \
			|| die "Unable to make _verison.py from ${EBZR_BRANCH_DIR}"
	fi
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile
	docbook2man -o doc doc/be.1.sgml || die "docbook2man failed"
	mv doc/BE.1 doc/be.1 || die "mv failed"
}

src_install() {
	distutils_src_install
	dodoc AUTHORS NEWS README || die "dodoc failed"
	if [[ ${PV} != "9999" ]] ; then
		dodoc ChangeLog || die "dodoc failed"
	fi
}

pkg_postinst() {
	python_mod_optimize lib${PN}
	python_mod_optimize ${PN}commands
}

pkg_postrm() {
	python_mod_cleanup lib${PN}
	python_mod_cleanup ${PN}commands
}
