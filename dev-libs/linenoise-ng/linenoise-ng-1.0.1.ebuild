# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="A small self-contained alternative to readline and libedit that supports UTF-8"
HOMEPAGE="https://github.com/arangodb/linenoise-ng"
SRC_URI="https://github.com/arangodb/linenoise-ng/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
