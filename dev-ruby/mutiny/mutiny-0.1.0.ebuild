# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A tiny and experimental mutation testing framework for exploring research ideas"
HOMEPAGE="https://github.com/mutiny/mutiny"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/parser-2.2.2"
ruby_add_rdepend ">=dev-ruby/unparser-0.2.4"
ruby_add_rdepend ">=dev-ruby/gli-2.13.0"
ruby_add_rdepend ">=dev-ruby/metamorpher-0.2.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.10.2"
ruby_add_rdepend ">=dev-ruby/rake-10.4.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/aruba-0.6.0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.4.6"
ruby_add_rdepend ">=dev-ruby/rubocop-0.31.0"

