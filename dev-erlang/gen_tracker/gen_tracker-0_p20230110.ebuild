# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="76d149d7cd8855b703de568c397fd5fd06d368f9"

DESCRIPTION="supervisor with ets handling of children and their metadata"
HOMEPAGE="https://github.com/erlyvideo/gen_tracker"
SRC_URI="https://github.com/erlyvideo/gen_tracker/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
