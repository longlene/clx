# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=CWEST
inherit perl-module

DESCRIPTION="Pid File Manipulation"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_TEST="do"

DEPEND="dev-perl/Class-Accessor"
RDEPEND="${DEPEND}"

