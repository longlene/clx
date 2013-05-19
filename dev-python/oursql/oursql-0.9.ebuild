# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

MY_PV="${PV/_/}"
MY_P="oursql-${MY_PV}"
DESCRIPTION="oursql is a set of MySQL bindings for python with a focus on wrapping the MYSQL_STMT API to provide real parameterization and real server-side cursors."
HOMEPAGE="https://launchpad.net/oursql"
SRC_URI="https://launchpad.net/oursql/trunk/${MY_PV}/+download/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ~ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=virtual/mysql-4.1"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
