# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="A few thought experiments solidified as code"
HOMEPAGE="https://github.com/JanHenryNystrom/jhn_stdlib"
SRC_URI="https://github.com/JanHenryNystrom/jhn_stdlib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
