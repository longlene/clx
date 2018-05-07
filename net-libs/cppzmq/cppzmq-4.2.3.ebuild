# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="High-level CPP Binding for ZeroMQ"
HOMEPAGE="https://github.com/zeromq/cppzmq"
SRC_URI="https://github.com/zeromq/cppzmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=net-libs/zeromq-3"
DEPEND=""

