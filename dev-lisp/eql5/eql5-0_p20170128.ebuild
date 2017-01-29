# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 qmake-utils vcs-snapshot kde5-functions

EGIT_COMMIT="f0ab71b30b1fec7abdafacfacdc8eef1beef1345"

DESCRIPTION="Embedded Qt Lisp"
HOMEPAGE="https://gitlab.com/eql/eql5"
SRC_URI="https://gitlab.com/eql/EQL5/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="qthelp multimedia webkit"

DEPEND="
	dev-lisp/ecls[threads,unicode]
	qthelp? ( $(add_qt_dep qthelp) )
	$(add_qt_dep qtcore)
	$(add_qt_dep qtgui)
	multimedia? ( $(add_qt_dep qtmeltimedia) )
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	webkit? ( $(add_qt_dep qtwebkit) )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/g_completions/{s#malloc#(char **)malloc#}' \
		-i src/lisp/ecl-readline.lisp
}

src_compile() {
	pushd src/lisp && ecl -compile ecl-readline.lisp && popd

	pushd src
	ecl --shell make-eql-lib.lisp
	eqmake5 eql_lib.pro && emake
	eqmake5 eql_exe.pro && emake
	LD_LIBRARY_PATH="${S}" "${S}"/eql5 make-eql-lib-wrappers.lisp
	touch tmp/eql.o && eqmake5 eql_lib.pro && emake

	local modules=""
	use qthelp && modules+="module_help "
	use multimedia && modules+="module_multimedia "
	modules+="module_network "
	modules+="module_quick "
	modules+="module_sql "
	modules+="module_svg "
	use webkit && modules+="module_webkit "
	local module=""
	for module in ${modules} ; do
		eqmake5 ${module}.pro && emake
	done

	popd
}

src_install() {
	dobin eql5
	dolib.so libeql5*.so*
	dodoc README-1.txt
}
