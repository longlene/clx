# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gridinit command line utilities to help you use the Gridinit API"
HOMEPAGE="http://github.com/90kts/grid"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/watirgrid-0"
ruby_add_rdepend ">=dev-ruby/watirgrid-0"

