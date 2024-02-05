# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="6e8bec88f7d721d3f84fefef0c27ca4444c3cdd3"

DESCRIPTION="nanoid implementation for Erlang"
HOMEPAGE="https://github.com/ukarim/enanoid"
SRC_URI="https://github.com/ukarim/enanoid/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
