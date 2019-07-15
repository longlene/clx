# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Micro benchmarking Erlang library"
HOMEPAGE="https://github.com/lpgauth/timing"
SRC_URI="https://github.com/lpgauth/timing/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/bear-0.8.2
	dev-erlang/hdr_histogram
"
BDEPEND=""
