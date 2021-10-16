# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="High-performance C++ multibody dynamics/physics library"
HOMEPAGE="https://simtk.org/home/simbody"
SRC_URI="https://github.com/simbody/simbody/archive/Simbody-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
