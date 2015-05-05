# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="You play as a warrior climbing a tall tower"
HOMEPAGE="https://github.com/rafmagana/ruby-warrior-i18n"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/r18n-desktop-1.1.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "=dev-ruby/rspec-2.8.0"
ruby_add_rdepend "=dev-ruby/cucumber-1.2.1"
ruby_add_rdepend "=dev-ruby/mocha-0.11.4"

