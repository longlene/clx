# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="An easy to use C++-wrapper for libclang"
HOMEPAGE="https://github.com/cppit/libclangmm/"
SRC_URI="https://github.com/cppit/libclangmm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="sys-devel/clang"
RDEPEND="${DEPEND}"
