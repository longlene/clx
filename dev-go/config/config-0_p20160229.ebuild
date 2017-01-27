# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/larspensjo/config"
EGIT_COMMIT="b6db95dc6321c46dab9cd53d0c85164a27686aa6"

DESCRIPTION="Configuration file parser for INI format"
HOMEPAGE="https://github.com/larspensjo/config"
SRC_URI="https://github.com/larspensjo/config/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
