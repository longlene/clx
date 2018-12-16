# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extracted from Grape, A Ruby framework for rapid API development with great conventions"
HOMEPAGE="https://github.com/intridea/grape-entity"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3.2"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/maruku-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.9"
ruby_add_rdepend ">=dev-ruby/bundler-0"

