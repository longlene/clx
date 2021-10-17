# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="a library to manipulate biological sequences"
HOMEPAGE="https://github.com/rega-cev/libseq"
SRC_URI="https://github.com/rega-cev/libseq/archive/release-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
"
RDEPEND="${DEPEND}"
