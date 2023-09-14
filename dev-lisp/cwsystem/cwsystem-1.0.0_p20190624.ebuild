# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eece959061e08ee12e151a84e19ee9c94d06b0fc"

DESCRIPTION="Print English numbers by The Conway-Wechsler System"
HOMEPAGE="https://github.com/nptcl/cwsystem"
SRC_URI="https://github.com/nptcl/cwsystem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
