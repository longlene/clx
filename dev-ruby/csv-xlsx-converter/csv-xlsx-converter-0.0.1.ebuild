# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Convert CSV to Excel xlsx, Excel xlsx to CSV"
HOMEPAGE="http://github.com/if1live/csv-xlsx-converter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyXL-3.3.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/jeweler-2.0.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.13"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"

