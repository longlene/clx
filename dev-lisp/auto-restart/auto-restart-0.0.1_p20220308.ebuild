# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16ca8969a327629cac4d25f7f5509699be8b9f93"

DESCRIPTION="automatically generate restart-cases for the most common use cases"
HOMEPAGE="https://github.com/tdrhq/auto-restart/"
SRC_URI="https://github.com/tdrhq/auto-restart/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
"
BDEPEND=""
