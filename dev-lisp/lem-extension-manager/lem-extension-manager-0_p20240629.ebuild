# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bcc8be30a8edd806fd1cde780e19418bafecc84f"

DESCRIPTION="Lem Extension Manager"
HOMEPAGE="https://github.com/lem-project/lem-extension-manager"
SRC_URI="https://github.com/lem-project/lem-extension-manager/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
