# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Utopia is a website generation framework which provides a robust set of tools to build highly complex dynamic websites"
HOMEPAGE="https://github.com/ioquatix/utopia"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/trenni-3.0"
ruby_add_rdepend ">=dev-ruby/mime-types-3.0"
ruby_add_rdepend ">=dev-ruby/samovar-1.2"
ruby_add_rdepend ">=dev-ruby/rainbow-2.1"
ruby_add_rdepend ">=dev-ruby/rack-2.0"
ruby_add_rdepend ">=dev-ruby/http-accept-1.6"
ruby_add_rdepend ">=dev-ruby/mail-2.6"
ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.6"
ruby_add_rdepend ">=dev-ruby/falcon-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

