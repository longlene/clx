# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

EGO_PN="github.com/glassechidna/zxing-cpp"
EGIT_COMMIT="6b3cbe02a332bff0f5ba0416f221d3d3876afdc2"

DESCRIPTION="ZXing C++ Library"
HOMEPAGE="https://github.com/glassechidna/zxing-cpp"
SRC_URI="https://github.com/glassechidna/zxing-cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
