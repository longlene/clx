# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ODF generation library for Ruby"
HOMEPAGE="https://github.com/thiagoarrais/rodf"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/builder-3.0"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.9"
ruby_add_rdepend ">=dev-ruby/hpricot-0.8.6"
ruby_add_rdepend ">=dev-ruby/rspec_hpricot_matchers-1.0"

