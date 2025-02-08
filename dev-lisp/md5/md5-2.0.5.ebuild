# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp implementation of the MD5 Message-Digest Algorithm"
HOMEPAGE="https://github.com/pmai/md5"
SRC_URI="https://github.com/pmai/md5/archive/refs/tags/release-${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-release-${PV}
