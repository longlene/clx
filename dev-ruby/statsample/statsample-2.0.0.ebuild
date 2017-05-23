# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A suite for basic and advanced statistics on Ruby"
HOMEPAGE="https://github.com/sciruby/statsample"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/daru-0.1"
ruby_add_rdepend ">=dev-ruby/spreadsheet-1.0.3"
ruby_add_rdepend ">=dev-ruby/reportbuilder-1.4"
ruby_add_rdepend ">=dev-ruby/minimization-0.2"
ruby_add_rdepend ">=dev-ruby/dirty-memoize-0.0.4"
ruby_add_rdepend ">=dev-ruby/extendmatrix-0.4"
ruby_add_rdepend ">=dev-ruby/rserve-client-0.3"
ruby_add_rdepend ">=dev-ruby/rubyvis-0.6.1"
ruby_add_rdepend ">=dev-ruby/distribution-0.7"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.6"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rdoc-4.2"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5"
ruby_add_rdepend ">=dev-ruby/shoulda-matchers-2.2"
ruby_add_rdepend ">=dev-ruby/minitest-5.7"
ruby_add_rdepend ">=dev-ruby/gettext-3.1"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"
ruby_add_rdepend ">=dev-ruby/nmatrix-0.1.0"
ruby_add_rdepend ">=dev-ruby/gsl-nmatrix-1.17.0"

