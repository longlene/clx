# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils multilib versionator

MY_PN="xerces-c-src"
MY_P=${MY_PN}_$(replace_all_version_separators _)

DESCRIPTION="Xerces-C++ is a validating XML parser written in a portable subset of C++."
HOMEPAGE="http://xml.apache.org/xerces-c/index.html"
SRC_URI="mirror://gentoo/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="alpha amd64 ~hppa ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="doc elibc_FreeBSD"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND=""

S=${WORKDIR}/${MY_P}

pkg_setup() {
	eval unset ${!LC_*} LANG
	eval echo ${LC_ALL}
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Fix multilib install
	epatch "${FILESDIR}/${P}-multilib.patch"
	epatch "${FILESDIR}/${P}-libpath.patch"
}

src_compile() {
	export XERCESCROOT="${S}"
	cd src/xercesc
	local target=linux
	use elibc_FreeBSD && target=freebsd
	./runConfigure -p"${target}" -P/usr ${EXTRA_ECONF}
	emake -j1 || die "emake failed"
}

src_install () {
	export XERCESCROOT="${S}"
	cd "${S}"/src/xercesc
	emake DESTDIR="${D}" MLIBDIR=$(get_libdir) install || die "emake failed"

	if use doc; then
		dodir /usr/share/doc/${PF}
		cp -pPR "${S}/samples" "${D}/usr/share/doc/${PF}"
		cd "${S}/doc"; doxygen
		dohtml -r html
	fi

	cd "${S}"
	dodoc STATUS credits.txt version.incl
	dohtml Readme.html

	unset XERCESCROOT
}
