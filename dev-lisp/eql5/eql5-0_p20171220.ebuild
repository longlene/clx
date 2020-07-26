# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 qmake-utils vcs-snapshot

EGIT_COMMIT="021b44a56e1191ea5e25e6de96bce5a9d6d23b11"

DESCRIPTION="Embedded Qt Lisp"
HOMEPAGE="https://gitlab.com/eql/eql5"
SRC_URI="https://gitlab.com/eql/EQL5/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="qthelp multimedia"

DEPEND="
	dev-lisp/ecls[threads,unicode]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols:t
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qtwebkit:5
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use qthelp || sed -i 's#help\ \\#\\#' src/eql5.pro
	use multimedia ||sed -i 's#multimedia\ \\#\\#' src/eql5.pro
}

src_compile() {
	pushd src
	ecl --shell make.lisp
	eqmake5 PREFIX="${D}"/usr eql5.pro && emake
	#LD_LIBRARY_PATH="${S}" "${S}"/eql5 make-wrappers.lisp

	popd
}

src_install() {
	dobin eql5
	insinto /usr/include
	doins -r src/eql5
	dolib.so libeql5*.so*
	dodoc -r doc
}
