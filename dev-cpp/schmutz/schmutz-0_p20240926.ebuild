# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="a6d774cc52b73a2d940e80392f30c2b87bf84c42"

DESCRIPTION="easy Guile Scheme C++ bindings"
HOMEPAGE="https://github.com/arximboldi/schmutz"
SRC_URI="https://github.com/arximboldi/schmutz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-scheme/guile
"
RDEPEND="${DEPEND}"
BDEPEND=""
