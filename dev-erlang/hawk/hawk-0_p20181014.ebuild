# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar3 vcs-snapshot

EGIT_COMMIT="94b029054a5c564c225e8dca2df756ce6dca4783"

DESCRIPTION="Erlang OTP node distribution management"
HOMEPAGE="https://github.com/ruanpienaar/hawk"
SRC_URI="https://github.com/ruanpienaar/hawk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
