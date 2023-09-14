# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Simple-Web-Server"
HOMEPAGE="https://github.com/eidheim/Simple-Web-Server"
SRC_URI="https://github.com/eidheim/Simple-Web-Server/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
"
RDEPEND="${DEPEND}"
