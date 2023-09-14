# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Draw graph with daru"
HOMEPAGE="https://github.com/genya0407/daru-plotly"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/daru-0"
ruby_add_rdepend ">=dev-ruby/rbplotly-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rbczmq-0"
ruby_add_rdepend ">=dev-ruby/iruby-0"
ruby_add_rdepend ">=dev-ruby/spreadsheet-0"
ruby_add_rdepend ">=dev-ruby/nyaplot-0"
ruby_add_rdepend ">=dev-ruby/gruff-0"

