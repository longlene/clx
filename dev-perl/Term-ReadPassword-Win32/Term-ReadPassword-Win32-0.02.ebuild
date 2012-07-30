# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="KTAKATA"
inherit perl-module

DESCRIPTION="Portable (console) password input support"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-perl/Term-ReadPassword"

SRC_TEST="do"
