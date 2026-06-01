# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HOMEPAGE="
	https://pypi.org/project/bondy/
"
SRC_URI="https://github.com/Leapsight/bondy/archive/refs/tags/0.8.8.4.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
