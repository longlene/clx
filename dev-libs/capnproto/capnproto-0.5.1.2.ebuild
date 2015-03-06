# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Cap'n Proto serialization/RPC system"
HOMEPAGE="https://github.com/sandstorm-io/capnproto"
SRC_URI="https://github.com/sandstorm-io/capnproto/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/c++
