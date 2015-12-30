# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A rack middleware for enforcing rewrite rules"
HOMEPAGE="http://github.com/jtrupiano/rack-rewrite"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/shoulda-2.10.2"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.7"
ruby_add_rdepend ">=dev-ruby/rack-0"

