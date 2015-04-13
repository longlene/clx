# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby19 ruby20"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for zeromq."
HOMEPAGE="http://www.zeromq.org/bindings:ruby"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""
DEPEND="net-libs/zeromq"
