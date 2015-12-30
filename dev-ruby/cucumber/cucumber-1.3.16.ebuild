# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Behaviour Driven Development with elegance and joy"
HOMEPAGE="http://cukes.info"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.1.3"
ruby_add_rdepend ">=dev-ruby/gherkin-2.12"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7.5"
ruby_add_rdepend ">=dev-ruby/multi_test-0.1.1"
ruby_add_rdepend ">=dev-ruby/aruba-0.5.2"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.2"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rspec-2"
ruby_add_rdepend ">=dev-ruby/simplecov-0.6.2"
ruby_add_rdepend ">=dev-ruby/spork-0.9.2"
ruby_add_rdepend ">=dev-ruby/syntax-1.0.0"
ruby_add_rdepend ">=dev-ruby/bcat-0.6.2"
ruby_add_rdepend ">=dev-ruby/kramdown-0.14"
ruby_add_rdepend ">=dev-ruby/yard-0.8.0"
ruby_add_rdepend ">=dev-ruby/capybara-1.1.2"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.1"
ruby_add_rdepend ">=dev-ruby/ramaze-0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3.2"
ruby_add_rdepend ">=dev-ruby/webrat-0.7.3"
ruby_add_rdepend "<dev-ruby/mime-types-2.0"
ruby_add_rdepend "<dev-ruby/rubyzip-1.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
