# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

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

ruby_add_rdepend ">=dev-ruby/fastercsv-0"
ruby_add_rdepend ">=dev-ruby/jekyll-1.4"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"

