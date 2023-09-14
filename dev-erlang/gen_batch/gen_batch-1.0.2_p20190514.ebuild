# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="7d042edf0cdc415e902b7c79b6a2dd7c4ec64727"

DESCRIPTION="A batch job running library for embedded Erlang/OTP"
HOMEPAGE="https://github.com/rackerlabs/gen_batch"
SRC_URI="https://github.com/rackerlabs/gen_batch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
