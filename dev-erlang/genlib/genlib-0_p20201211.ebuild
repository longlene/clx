# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="4565a8d73f34a0b78cca32c9cd2b97d298bdadf8"

DESCRIPTION="A collection of general implementations of common activities"
HOMEPAGE="https://github.com/rbkmoney/genlib"
SRC_URI="https://github.com/rbkmoney/genlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
