# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
EGO_PN="github.com/zenazn/goji"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Goji is a minimalistic web framework for Golang that's high in antioxidants"
HOMEPAGE="https://github.com/zenazn/goji"
SRC_URI="https://github.com/zenazn/goji/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dodoc README.md
}
