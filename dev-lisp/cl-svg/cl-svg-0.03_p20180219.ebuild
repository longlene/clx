# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1e988ebd2d6e2ee7be4744208828ef1b59e5dcdc"

DESCRIPTION="Produce Scalable Vector Graphics files with Common Lisp"
HOMEPAGE="https://github.com/wmannis/cl-svg"
SRC_URI="https://github.com/wmannis/cl-svg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
