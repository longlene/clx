# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Boson is a modular command/task framework"
HOMEPAGE="http://tagaholic.me/boson/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mocha-0.12.0"
ruby_add_rdepend ">=dev-ruby/bacon-1.1.0"
ruby_add_rdepend ">=dev-ruby/mocha-on-bacon-0.2.1"
ruby_add_rdepend ">=dev-ruby/bacon-bits-0"
ruby_add_rdepend ">=dev-ruby/bahia-0.5.0"

