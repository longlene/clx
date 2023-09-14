# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="591f0e36e8e56cb6df54b31ca15e53032f33c6dd"

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
