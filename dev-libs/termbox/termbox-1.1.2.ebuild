# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9} )
PYTHON_REQ_USE="threads"

inherit python-single-r1 waf-utils

DESCRIPTION="Library for writing text-based user interfaces"
HOMEPAGE="https://github.com/nsf/termbox"
SRC_URI="https://github.com/nsf/termbox/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
#IUSE="python"

DEPEND=""
RDEPEND="${DEPEND}"

WAF_BINARY="${S}"/waf
