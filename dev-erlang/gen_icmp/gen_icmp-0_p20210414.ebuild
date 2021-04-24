# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="d6fad4a2772e0e1dac2638a395310909335f2e0d"

DESCRIPTION="ICMP protocol implementation for Erlang without NIFs"
HOMEPAGE="https://github.com/hauleth/gen_icmp"
SRC_URI="https://github.com/hauleth/gen_icmp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
