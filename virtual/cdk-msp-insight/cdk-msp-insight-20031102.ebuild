# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit rpm

MY_P=${P/20031102/5.1.1-20031102}

DESCRIPTION="MSP430 Cross Development Kit - Insight"
HOMEPAGE="http://cdk4msp.sourceforge.net/"
SRC_URI="mirror://sourceforge/cdk4msp/${MY_P}.i386.rpm"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="-* ~x86"

IUSE=""

DEPEND="
	>=dev-embedded/cdk4msp-0.2
	!dev-embedded/cdk-msp-gdb
"

src_install() {
	dodir /opt/cdk4msp
	mv ${WORKDIR}/opt/cdk4msp/* ${D}/opt/cdk4msp
	fperms ogu+rX /opt/cdk4msp/bin
	fperms ogu+rX /opt/cdk4msp/share
	fperms ogu+rX /opt/cdk4msp/man
	fperms ogu+rX /opt/cdk4msp/doc
}

