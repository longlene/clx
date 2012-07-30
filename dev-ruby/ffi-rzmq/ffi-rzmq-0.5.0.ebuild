# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ree18 ruby19 jruby"

inherit ruby-ng git

DESCRIPTION="Ruby FFI bindings for zeromq"
HOMEPAGE="http://www.zeromq.org/bindings:ruby-ffi"
EGIT_REPO_URI="git://github.com/chuckremes/${PN}.git"
EGIT_MASTER="${PV}"
IUSE="doc examples"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"

RDEPEND="${DEPEND}
		>=dev-ruby/ffi-0.6.3"
DEPEND=">=dev-ruby/bones-3.4.3
		dev-libs/zeromq"

src_prepare() {
	# Dirty, dirty hack until ruby-ng is hopefully working with git eclass.
	for _RUBY in $USE_RUBY "all"
	do
		mkdir "${WORKDIR}/${_RUBY}"
		cp -a "${S}" "${WORKDIR}/${_RUBY}"
	done
}

each_ruby_compile() {
	rake gem:package
}

each_ruby_install() {
	local gemsitedir=$(ruby_rbconfig_value 'sitelibdir' | sed -e 's:site_ruby:gems:')

	# rubygems tries to create GEM_HOME if it doesn't exist, upsetting sandbox,
	# bug #202109. Since 1.2.0 we also need to set GEM_PATH for this reason, bug #230163
	export GEM_HOME="${D}${gemsitedir}"
	export GEM_PATH="${GEM_HOME}/"
	keepdir ${gemsitedir}/{doc,gems,cache,specifications}

	myconf=""
	if ! use doc; then
		myconf="${myconf} --no-ri --no-rdoc"
	fi

	gem install ${myconf} "pkg/${P}.gem"
}

all_ruby_install() {
	dodoc README.rdoc || die "dodoc README.rdoc failed"

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die "Installation of examples failed"
	else
		rm -rf "${GEM_HOME}/gems/${P}/examples"
	fi
}
