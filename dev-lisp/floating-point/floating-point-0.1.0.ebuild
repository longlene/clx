# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="Floating point functions"
HOMEPAGE="https://github.com/OdonataResearchLLC/floating-point"
SRC_URI="https://github.com/OdonataResearchLLC/floating-point/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
