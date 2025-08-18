# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="45cef2398270f48c352ef438d9d524633200144a"

DESCRIPTION="Named lambda and named let macros"
HOMEPAGE="https://github.com/jrm-code-project/named-let"
SRC_URI="https://github.com/jrm-code-project/named-let/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
