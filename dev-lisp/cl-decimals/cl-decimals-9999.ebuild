# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="Decimal number parser and formatter package for the Common Lisp language"
HOMEPAGE="https://github.com/tlikonen/cl-decimals"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tlikonen/cl-decimals.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
