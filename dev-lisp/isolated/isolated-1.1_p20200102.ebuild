# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="05bbc0341b53791e1cff88ad4548bb94d0667cad"

DESCRIPTION="A restricted environment for Common Lisp code evaluation"
HOMEPAGE="https://github.com/kanru/cl-isolated"
SRC_URI="https://github.com/kanru/cl-isolated/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""
