# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="The Lisa Expert System Shell"
HOMEPAGE="https://github.com/youngde811/Lisa"
SRC_URI="https://github.com/youngde811/Lisa/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/log4cl
"

S="${WORKDIR}"/Lisa-${PV}
