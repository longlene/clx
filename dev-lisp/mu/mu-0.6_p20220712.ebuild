# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="831c551d43997d471bceeb542ebabf97c050c0bf"

DESCRIPTION="my support utilities"
HOMEPAGE="https://bitbucket.org/chunsj/mu/"
SRC_URI="https://bitbucket.org/chunsj/mu/get/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-csv
"
BDEPEND=""
