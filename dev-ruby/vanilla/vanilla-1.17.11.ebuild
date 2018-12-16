# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A bliki-type web content thing"
HOMEPAGE="http://github.com/lazyatom/vanilla-rb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/BlueCloth-1.0.0"
ruby_add_rdepend ">=dev-ruby/haml-3.1"
ruby_add_rdepend ">=dev-ruby/parslet-1.2.0"
ruby_add_rdepend ">=dev-ruby/rack-0.9.1"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.7"
ruby_add_rdepend ">=dev-ruby/ratom-0.3.5"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.1.1"
ruby_add_rdepend ">=dev-ruby/soup-1.0.11"

