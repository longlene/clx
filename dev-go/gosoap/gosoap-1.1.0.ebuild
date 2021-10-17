# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tiaguinho/gosoap"

DESCRIPTION="SOAP package for Go"
HOMEPAGE="https://github.com/tiaguinho/gosoap"
SRC_URI="https://github.com/tiaguinho/gosoap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
