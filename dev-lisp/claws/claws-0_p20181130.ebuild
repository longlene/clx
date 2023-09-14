# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b67d3eac1c56624f6af12ee1f653ebef857e6536"

DESCRIPTION="Work-stealing scheduler for LispWorks"
HOMEPAGE="https://github.com/pcostanza/claws"
SRC_URI="https://github.com/pcostanza/claws/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
