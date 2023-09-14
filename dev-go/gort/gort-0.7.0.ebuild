# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hybridgroup/gort"

DESCRIPTION="Command Line Interface For RobotOps"
HOMEPAGE="https://github.com/hybridgroup/gort"
SRC_URI="https://github.com/hybridgroup/gort/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/cli
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#github.com/codegangsta/cli#github.com/urfave/cli#' -i src/${EGO_PN}/gort.go
	sed -e 's#github.com/codegangsta/cli#github.com/urfave/cli#' -i src/${EGO_PN}/commands/*.go
}

src_install() {
	golang-build_src_install
	dobin bin/gort
	dodoc src/${EGO_PN}/README.md
}
