# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="e35b9b3a32b8f580daff1a7d1102813ad530835e"

DESCRIPTION="Prototype implementation of Conflict-free Replicated Data Types"
HOMEPAGE="https://github.com/lasp-lang/types"
SRC_URI="https://github.com/lasp-lang/types/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
