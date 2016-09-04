# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Quantcast File System"
HOMEPAGE="https://quantcast.atlassian.net/"
SRC_URI="https://github.com/quantcast/qfs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="virtual/krb5"
RDEPEND="${DEPEND}"
