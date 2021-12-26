# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A better date duration representation for Common Lisp programs"
HOMEPAGE="https://github.com/40ants/humanize-duration"
SRC_URI="https://github.com/40ants/humanize-duration/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
