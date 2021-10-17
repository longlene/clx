# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gotschmarcel/goserv"

DESCRIPTION="A lightweight toolkit for web applications in Go"
HOMEPAGE="http://goserv.it"
SRC_URI="https://github.com/gotschmarcel/goserv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
