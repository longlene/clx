# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="An object oriented C++ wrapper for CURL"
HOMEPAGE="http://josephp91.github.io/curlcpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/JosephP91/curlcpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"
