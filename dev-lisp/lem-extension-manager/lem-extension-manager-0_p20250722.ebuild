# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b8104d23d7204b7a507759314dfadad6c2b4752f"

DESCRIPTION="Lem Extension Manager"
HOMEPAGE="https://github.com/lem-project/lem-extension-manager"
SRC_URI="https://github.com/lem-project/lem-extension-manager/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
