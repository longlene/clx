# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="C++ Benchmark Authoring Library/Framework"
HOMEPAGE="https://github.com/DigitalInBlue/Celero"
SRC_URI="https://github.com/DigitalInBlue/Celero/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ECL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
