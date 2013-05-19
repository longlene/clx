# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils python toolchain-funcs

MY_P="${P/pylucene/PyLucene-src}-1"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Python bindings od Lucene search engine"
HOMEPAGE="http://pylucene.osafoundation.org/"
SRC_URI="http://downloads.osafoundation.org/PyLucene/src/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/python
	>=sys-devel/gcc-3.4
	|| ( app-admin/eselect-compiler sys-devel/gcc-config )"
RDEPEND=""
	
python_version

pkg_setup() {
	built_with_use sys-devel/gcc gcj || die "PyLucene requires gcj compiler"
	if [ "$(gcc-version)" != "3.4" ]; then
		die "PyLucene can currently only be built using gcc 3.4"
	fi
}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/pylucene-2.0-nostrip.patch
	epatch ${FILESDIR}/pylucene-2.0-perms.patch
}

src_compile() {
	make PYTHON_VER=${PYVER} \
	     PREFIX=/usr PREFIX_PYTHON=/usr \
		 GCJ_HOME=/usr GCJ_LIBDIR=/usr/lib GCJ_STATIC=0 \
		 CC=${CC-gcc} CXX=${CXX-g++} JCC=${GCJ-gcj} JCCH=${GCJH-gcjh} JAR=gcj-jar \
		 all || die
}

src_install() {
	if [ -f /usr/bin/gcc-config ] ; then
	    # see bug #81416, comment 19-20 for why is this needed
		GCC_LDPATH=$(gcc-config -L | sed 's/:.*//')
	else
		GCC_LDPATH=`eselect compiler getval LDPATH`
	fi

	dodoc CHANGES CREDITS LICENSE README

	dodir /usr/lib/python${PYVER}/site-packages
	emake GCJ_LIBDIR=${GCC_LDPATH} PYTHON_VER=${PYVER} PREFIX_PYTHON=${D}/usr \
	      install || die
}

pkg_postinst() {
	python_version
	python_mod_optimize /usr/lib/python${PYVER}/site-packages
}

pkg_postrm() {
	python_version
	python_mod_cleanup /usr/lib/python${PYVER}/site-packages
}
