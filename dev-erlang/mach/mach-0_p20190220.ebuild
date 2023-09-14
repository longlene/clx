# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="82cc3a4d4a74257f28b7dab8c73898f0c65f536a"

DESCRIPTION="Service Machine Walker"
HOMEPAGE="https://github.com/synrc/mach"
SRC_URI="https://github.com/synrc/mach/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/kvs
	>=dev-erlang/jsone-0.3.3
	dev-erlang/n2o
"
BDEPEND=""
