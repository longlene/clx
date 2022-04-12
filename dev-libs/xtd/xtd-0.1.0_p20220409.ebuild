# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="d5b6fbc6831a55caec0b04819b8f4f4e41ed7a75"

DESCRIPTION="Free open-source modern C++ framework to create console and forms applications"
HOMEPAGE="https://github.com/gammasoft71/xtd"
SRC_URI="https://github.com/gammasoft71/xtd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-libs/gsound
"
RDEPEND="${DEPEND}"
BDEPEND=""
