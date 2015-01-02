# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides the Import command for Jekyll"
HOMEPAGE="http://github.com/jekyll/jekyll-import"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-1.4"
ruby_add_rdepend ">=dev-ruby/fastercsv-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2"
ruby_add_rdepend ">=dev-ruby/redgreen-1.2"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5"
ruby_add_rdepend ">=dev-ruby/rr-1.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"
ruby_add_rdepend ">=dev-ruby/simplecov-gem-adapter-1.0.1"
ruby_add_rdepend ">=dev-ruby/sequel-3.42"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.3"
ruby_add_rdepend ">=dev-ruby/hpricot-0.8"
ruby_add_rdepend ">=dev-ruby/mysql-2.8"
ruby_add_rdepend ">=dev-ruby/pg-0.12"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3"
ruby_add_rdepend ">=dev-ruby/behance-0.3"
ruby_add_rdepend ">=dev-ruby/unidecode-0"
ruby_add_rdepend ">=dev-ruby/launchy-2.4"

