# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="C++ binding for nanomsg"
HOMEPAGE="https://github.com/nanomsg/cppnanomsg"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nanomsg/cppnanomsg.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/nanomsg"
RDEPEND="${DEPEND}"
