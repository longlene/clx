# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot qmake-utils

EGO_PN="github.com/visualfc/goqt/..."

DESCRIPTION="Golang bindings to the Qt cross-platform application framework"
HOMEPAGE="https://github.com/visualfc/goqt"
SRC_URI="https://github.com/visualfc/goqt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-qt/qtgui:5
"
RDEPEND="${DEPEND}"

src_compile() {
	pushd src/${EGO_PN%/*}/qtdrv && eqmake5 && make && popd
	pushd src/${EGO_PN%/*}/tools/rcc && eqmake5 && make && popd
}

src_install() {
	EGO_PN=${EGO_PN%/*}/ui golang-build_src_install
}
