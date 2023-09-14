# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Provides a canonical way of converting class designators to classes"
HOMEPAGE="https://github.com/Hexstream/enhanced-find-class"
SRC_URI="https://github.com/Hexstream/enhanced-find-class/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
