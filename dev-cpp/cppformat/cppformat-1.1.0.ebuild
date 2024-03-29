# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit multilib cmake

DESCRIPTION="Small, safe and fast formatting library for C++"
HOMEPAGE="http://cppformat.github.io"
SRC_URI="https://github.com/cppformat/cppformat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
