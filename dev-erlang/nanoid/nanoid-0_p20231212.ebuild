# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="ba450219a55e5baac34b38668a7843582d0f975b"

DESCRIPTION="Unique ID Generator"
HOMEPAGE="https://github.com/zaryntech/nanoid"
SRC_URI="https://github.com/zaryntech/nanoid/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
