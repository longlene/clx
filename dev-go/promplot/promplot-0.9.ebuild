# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="qvl.io/promplot/"

DESCRIPTION="Create plots from Prometheus metrics and send them to you"
HOMEPAGE="https://github.com/qvl/promplot/"
SRC_URI="https://github.com/qvl/promplot/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/promplot
}
