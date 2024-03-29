# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.10.1.ebuild,v 1.1 2015/01/24 22:35:11 mrueg Exp $

EAPI=8

USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry is a powerful alternative to the standard IRB shell for Ruby"
HOMEPAGE="https://github.com/pry/pry/wiki"
SRC_URI="https://github.com/pry/pry/archive/v${PV}.tar.gz -> ${P}.tar.gz"
IUSE=""
SLOT="ruby19"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc64 ~x86 ~arm"

ruby_add_rdepend "
	>=dev-ruby/coderay-1.1.0
	>=dev-ruby/slop-3.4.1:3
	>=dev-ruby/method_source-0.8"

ruby_add_bdepend "
	test? (
		>=dev-ruby/open4-1.3
		>=dev-ruby/rake-0.9
		>=dev-ruby/mocha-1.0
	)"

all_ruby_prepare() {
	# Avoid unneeded dependency on git.
	# Loosen coderay dependency.
	sed -e '/git ls-files/d' \
		-e '/coderay/s/~>/>=/' \
		-e '/bundler/d' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -e '/[Bb]undler/d' -e "1irequire 'mocha/api'\ " -i spec/helper.rb || die
	sed -e "1irequire 'ostruct'\ " -i spec/hooks_spec.rb || die
	sed -e '/of Class after the singleton classes/,+4d' -i spec/method_spec.rb || die
	# Out of date tests
	rm spec/commands/gist_spec.rb || die
}
