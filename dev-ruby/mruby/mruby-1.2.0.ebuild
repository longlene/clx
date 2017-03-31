# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib savedconfig

DESCRIPTION="mruby is the lightweight implementation of the Ruby language complying to (part of) the ISO standard."
HOMEPAGE="https://github.com/mruby/mruby"
SRC_URI="https://github.com/mruby/mruby/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="savedconfig"

DEPEND=""
RDEPEND="${DEPEND}
	sys-devel/bison
	dev-lang/ruby
"

src_prepare() {
	default
	if use savedconfig ; then
		restore_config build_config.rb
	fi
}

src_install() {
	if use !savedconfig; then
		save_config build_config.rb
	fi
	dobin bin/{mirb,mrbc,mrdb,mruby}
	dolib.a build/host/lib/{libmruby.a,libmruby_core.a}

	insinto /usr/include/
	doins -r include/{mrbconf.h,mruby,mruby.h}
	dodoc -r doc/guides
}
