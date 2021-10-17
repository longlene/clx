# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mozillazg/request"

DESCRIPTION="A developer-friendly HTTP request library for Gopher"
HOMEPAGE="https://github.com/mozillazg/request"
SRC_URI="https://github.com/mozillazg/request/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-simplejson
"
RDEPEND="${DEPEND}"
