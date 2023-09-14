# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A suite for basic and advanced statistics on Ruby"
HOMEPAGE="https://github.com/sciruby/statsample"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/daru-0.1.6"
ruby_add_rdepend ">=dev-ruby/spreadsheet-1.1"
ruby_add_rdepend ">=dev-ruby/reportbuilder-1.4"
ruby_add_rdepend ">=dev-ruby/minimization-0.2"
ruby_add_rdepend ">=dev-ruby/dirty-memoize-0.0.4"
ruby_add_rdepend ">=dev-ruby/extendmatrix-0.4"
ruby_add_rdepend ">=dev-ruby/rserve-client-0.3"
ruby_add_rdepend ">=dev-ruby/rubyvis-0.6.1"
ruby_add_rdepend ">=dev-ruby/distribution-0.7"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.6"
