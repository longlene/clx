# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/go-http-utils/headers"

DESCRIPTION="HTTP header constants for Gophers"
HOMEPAGE="https://github.com/go-http-utils/headers"
SRC_URI="https://github.com/go-http-utils/headers/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
