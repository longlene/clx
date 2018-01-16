# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Creates aliases for class methods, instance methods, constants, delegated methods and more"
HOMEPAGE="http://tagaholic.me/alias/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bacon-1.1.0"
ruby_add_rdepend ">=dev-ruby/bacon-bits-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.8"
ruby_add_rdepend ">=dev-ruby/mocha-on-bacon-0"

