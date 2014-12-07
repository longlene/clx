# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A suite for basic and advanced statistics on Ruby"
HOMEPAGE="http://ruby-statsample.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/spreadsheet-0.6.5"
ruby_add_rdepend ">=dev-ruby/reportbuilder-1.4"
ruby_add_rdepend ">=dev-ruby/minimization-0.2.0"
ruby_add_rdepend ">dev-ruby/fastercsv-0"
ruby_add_rdepend ">=dev-ruby/dirty-memoize-0.0"
ruby_add_rdepend ">=dev-ruby/extendmatrix-0.3.1"
ruby_add_rdepend ">dev-ruby/statsample-bivariate-extension-0"
ruby_add_rdepend ">=dev-ruby/rserve-client-0.2.5"
ruby_add_rdepend ">=dev-ruby/rubyvis-0.5"
ruby_add_rdepend ">=dev-ruby/distribution-0.6"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-0"
ruby_add_rdepend ">=dev-ruby/shoulda-3.1.1"
ruby_add_rdepend ">=dev-ruby/minitest-2.0"
ruby_add_rdepend ">=dev-ruby/ruby-gettext-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/hoe-git-0"

