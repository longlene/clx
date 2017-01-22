# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/soheilhy/cmux"

DESCRIPTION="Connection multiplexer for GoLang: serve different services on the same port!"
HOMEPAGE="https://github.com/soheilhy/cmux"
SRC_URI="https://github.com/soheilhy/cmux/archive/v0.1.2.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
