# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fast, safe, simple direct SQL executor for PG"
HOMEPAGE="https://discourse.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.16"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/pg-1.0.0"
ruby_add_rdepend ">=dev-ruby/guard-2.14"
ruby_add_rdepend ">=dev-ruby/guard-minitest-2.4"
ruby_add_rdepend ">=dev-ruby/activesupport-5.2"

