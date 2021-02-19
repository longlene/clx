# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="The C++ REST SDK"
HOMEPAGE="https://github.com/Microsoft/cpprestsdk"
SRC_URI="https://github.com/Microsoft/cpprestsdk/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/Release
