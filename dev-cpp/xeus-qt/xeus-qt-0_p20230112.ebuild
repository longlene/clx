# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="4f730b92578d221f115ced016f4732d1404c2c69"

DESCRIPTION="ZeroMQ-based middleware for xeus integrated in the Qt event loop"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-qt"
SRC_URI="https://github.com/jupyter-xeus/xeus-qt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/xeus
	dev-qt/qtcore
	net-libs/cppzmq

"
RDEPEND="${DEPEND}"
BDEPEND=""
