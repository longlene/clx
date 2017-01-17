# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tylerb/graceful"

DESCRIPTION="Graceful is a Go package enabling graceful shutdown of an http.Handler server"
HOMEPAGE="https://github.com/tylerb/graceful"
SRC_URI="https://github.com/tylerb/graceful/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
