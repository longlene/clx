# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="Micro http server and client written in C++"
HOMEPAGE="https://github.com/daedric/httpp/"
SRC_URI="https://github.com/daedric/httpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
"
RDEPEND="${DEPEND}"
