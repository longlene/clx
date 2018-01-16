# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby framework for rapid API development with great conventions"
HOMEPAGE="https://github.com/ruby-grape/grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.3.0"
ruby_add_rdepend ">=dev-ruby/mustermann19-0.4.3"
ruby_add_rdepend ">=dev-ruby/rack-accept-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3.2"
ruby_add_rdepend ">=dev-ruby/multi_xml-0.5.2"
ruby_add_rdepend ">=dev-ruby/hashie-2.1.0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend "=dev-ruby/grape-entity-0.5.0"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/maruku-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/cookiejar-0"
ruby_add_rdepend ">=dev-ruby/rack-contrib-0"
ruby_add_rdepend "<dev-ruby/mime-types-3.0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-0"
ruby_add_rdepend "=dev-ruby/rubocop-0.35.1"

