# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="static analysis tool for android apk"
HOMEPAGE="https://github.com/SecureBrain/ruby_apk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "<dev-ruby/rubyzip-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.1.5"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8.7"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

