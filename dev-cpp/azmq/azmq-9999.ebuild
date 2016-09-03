# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="C++ language bindings library integrating ZeroMQ with Boost Asio"
HOMEPAGE="https://github.com/zeromq/azmq"
SRC_URI=""

EGIT_REPO_URI="https://github.com/zeromq/azmq.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>dev-libs/boost-1.54[threads]
	dev-cpp/asio
	net-libs/zeromq
"
RDEPEND="${DEPEND}"
