# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="f8043e6c258d2e29d153bc37cb17b130fee0579f"

DESCRIPTION="easy Guile Scheme C++ bindings"
HOMEPAGE="https://github.com/arximboldi/schmutz"
SRC_URI="https://github.com/arximboldi/schmutz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
