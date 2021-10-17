# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="C++ Messaging Service is a JMS-like API for C++"
HOMEPAGE="http://activemq.apache.org/cms/"
SRC_URI="mirror://apache/activemq/activemq-cpp/${PV}/activemq-cpp-library-${PV}-src.tar.gz"

DEPEND="
	dev-libs/apr
	dev-libs/apr-util
"

RDEPEND="${DEPEND}"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

S="${WORKDIR}"/${PN}-library-${PV}

src_prepare() {
	eapply_user
	sed -e '/SUBDIRS/{s#src/examples##}' -i Makefile.in
}
